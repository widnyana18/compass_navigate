part of 'register_bloc.dart';

class RegisterEvent extends Equatable{  

  @override  
  List<Object> get props => [];  
}

class EmailChanged extends RegisterEvent{
  final String email;

  EmailChanged({this.email});

  @override  
  List<Object> get props => [email];  

  @override
  String toString() {
    return 'EmailChanged{email: $email}';    
  }
}

class PasswordChanged extends RegisterEvent{
  final String password;

  PasswordChanged({this.password});

  @override  
  List<Object> get props => [password];  

  @override
  String toString() {
    return 'PasswordChanged{password: $password}';    
  }
}

class Submitted extends RegisterEvent{
  final String email, password;

  Submitted({this.email, this.password});

  @override  
  List<Object> get props => [email, password];  

  @override
  String toString() {
    return 'Submitted{email: $email, password: $password}';    
  }
}