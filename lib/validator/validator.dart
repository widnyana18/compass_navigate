class Validators {
  
  static bool isValidEmail(String email){
    var regExp = RegExp(r'/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i');
    return regExp.hasMatch(email);
  }

  static bool isValidPassword(String password){
    var regExp = RegExp(r'/^((?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9]).{6,})\S$/');
    return regExp.hasMatch(password);
  }

  static bool isValidTelephone(String noTlp){
    var regExp = RegExp(r'/\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}/g');
    return regExp.hasMatch(noTlp);
  }

  static bool isValidDesc(String description){
    var regExp = RegExp(r'''/([+-]?(?:'.+?'|".+?"|[^+\- ]{1}[^ ]*))/g''');
    return regExp.hasMatch(description);
  }
}