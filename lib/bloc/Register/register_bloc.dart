import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:compass_navigate/repository/user_repository/user.dart';
import 'package:compass_navigate/validator/validator.dart';
import 'package:rxdart/rxdart.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository}) 
  : assert(userRepository != null), 
    _userRepository = userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();  

  @override
  Stream<RegisterState> transformEvents(
    Stream<RegisterEvent> events, 
    Stream<RegisterState> Function(RegisterEvent event) next
  ) {  
    final nonDebounceStream = events.where((event) =>
      event is! EmailChanged && event is! PasswordChanged
    );

    final debouceStream = events.where((event) => 
      event is EmailChanged && event is PasswordChanged
    ).debounceTime(Duration(milliseconds: 400));
    
    return super.transformEvents(nonDebounceStream.mergeWith([debouceStream]), next);
  }

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if(event is EmailChanged){
      yield* _mapEmailChangedtoState(event.email); 
    }
    else if(event is PasswordChanged){
      yield* _mapPasswordChangedtoState(event.password);
    }
    else if(event is Submitted){
      yield* _mapSubmittedtoState(event.email, event.password);
    }        
  }

  Stream<RegisterState> _mapEmailChangedtoState(String email) async*{
    yield state.update(
      isEmailValid: Validators.isValidEmail(email)
    );
  }

   Stream<RegisterState> _mapPasswordChangedtoState(String password) async*{
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password)
    );
  }

  Stream<RegisterState> _mapSubmittedtoState(String email, String password) async*{
    yield RegisterState.loading();          
    try{
      await _userRepository.signUp(
        email: email, 
        password: password
      );         

      yield RegisterState.success();      
    } catch(_){
      yield RegisterState.failure();
    }   
  }
}
  