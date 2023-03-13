import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:compass_navigate/repository/user_repository/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
   final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository}) 
  : assert(userRepository != null), 
    _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Authenticating();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if(event is AppStarted){
      yield* _mapAppStartedtoState();
    }
    else if(event is SignIn){
      yield* _mapSignIntoState();
    }
    else if(event is SignOut){
      yield* _mapSignOuttoState();
    }
  }

  Stream<AuthenticationState> _mapSignOuttoState() async*{
    final userExist = await _userRepository.isSignIn();

    try{
      if(userExist){
        yield Authenticated();
      }else{
        yield Unauthenticated();
      }
    }catch(_){
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapSignIntoState() async*{
    yield Authenticated();
  }

  Stream<AuthenticationState> _mapAppStartedtoState() async*{
    yield Unauthenticated();
    await _userRepository.signOut();
  }
}
