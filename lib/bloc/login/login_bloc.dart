import 'package:bloc/bloc.dart';
import 'package:compass_navigate/validator/validator.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:rxdart/rxdart.dart';

import 'package:compass_navigate/repository/user_repository/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc({@required UserRepository userRepository}) 
  : assert(userRepository != null), 
    _userRepository = userRepository;

  @override
  LoginState get initialState => LoginState.empty();  

  @override
  Stream<LoginState> transformEvents(
    Stream<LoginEvent> events, 
    Stream<LoginState> Function(LoginEvent evnet) next
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
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is EmailChanged){
      yield* _mapEmailChangedtoState(event.email);
    }
    else if(event is PasswordChanged){
      yield* _mapPasswordChangedtoState(event.password);
    }
    else if(event is LoginWithGoogleButton){
      yield* _mapLoginWithGoogletoState();
    }
    else if(event is LoginWithCredentials){
      yield* _mapLoginWithCredentialstoState(event.email, event.password);
    }
  }

  Stream<LoginState> _mapEmailChangedtoState(String email) async*{
    yield state.update(
      isEmailValid: Validators.isValidEmail(email)
    );
  }

  Stream<LoginState> _mapPasswordChangedtoState(String password) async*{
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password)
    );
  }

  Stream<LoginState> _mapLoginWithGoogletoState() async*{   
    LoginState.loading(); 
    try{
      await _userRepository.signInWithGoogle();            
      yield LoginState.success();

    } catch(_){
      yield LoginState.failure();
    }    
  }

  Stream<LoginState> _mapLoginWithCredentialstoState(String email, String password) async*{
    LoginState.loading();
    try{
      await _userRepository.signInWithCredentials(email, password);            
      yield LoginState.success();      
    } catch(_){
      yield LoginState.failure();
    }   
  }
}

