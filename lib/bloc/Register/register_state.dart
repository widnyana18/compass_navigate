part of 'register_bloc.dart';

@immutable
class RegisterState{
  final bool isEmailValid, isPasswordValid, isSubmitting, isFailure, isSuccess;      

  bool get isFormValid => isEmailValid && isPasswordValid;

  RegisterState({
    @required this.isEmailValid,
    @required this.isPasswordValid,        
    @required this.isSubmitting,
    @required this.isFailure,
    @required this.isSuccess
  });
  

  factory RegisterState.empty(){
    return RegisterState(
      isEmailValid : true,
      isPasswordValid : true,            
      isSubmitting : false,
      isFailure : false,
      isSuccess : false
    );
  }    

  factory RegisterState.loading(){
    return RegisterState(
      isEmailValid : true,
      isPasswordValid : true,            
      isSubmitting : true,
      isFailure : false,
      isSuccess : false
    );
  }

  factory RegisterState.success(){
    return RegisterState(
      isEmailValid : true,
      isPasswordValid : true,            
      isSubmitting : false,
      isFailure : false,
      isSuccess : true
    );
  }

  factory RegisterState.failure(){
    return RegisterState(
      isEmailValid : true,
      isPasswordValid : true,            
      isSubmitting : false,
      isFailure : false,
      isSuccess : false
    );
  }

  RegisterState update({
    bool isEmailValid, 
    bool isPasswordValid,        
  }){
   return copyWith( 
    isEmailValid : isEmailValid,
    isPasswordValid : isPasswordValid,        
    isSubmitting : false,
    isFailure : false,
    isSuccess : false
   );    
  }

  RegisterState copyWith({
    bool isEmailValid, 
    bool isPasswordValid,        
    bool isSubmitting, 
    bool isFailure,
    bool isSuccess
  }){ 
   return RegisterState( 
    isEmailValid : isEmailValid ?? this.isEmailValid,
    isPasswordValid : isPasswordValid ?? this.isPasswordValid,        
    isSubmitting : isSubmitting ?? this.isSubmitting,
    isFailure : isFailure ?? this.isFailure,
    isSuccess : isSuccess ?? this.isSuccess
   );    
  } 

   @override
    String toString() {
      return '''LoginState {
        isEmailValid: $isEmailValid,
        isPasswordValid: $isPasswordValid,                      
        isSubmitting: $isSubmitting,
        isSuccess: $isSuccess,
        isFailure: $isFailure,
      }''';
    }
}
