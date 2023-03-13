part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  @override  
  List<Object> get props => [];
}

class Authenticating extends AuthenticationState {}

class Authenticated extends AuthenticationState {}

class Unauthenticated extends AuthenticationState {}
