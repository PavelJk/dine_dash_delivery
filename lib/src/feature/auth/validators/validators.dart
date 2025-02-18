class Validator {
  static String? phoneNumber(String? value) {
    String patttern = r'(^\+7 \d{3} \d{3} \d{2} \d{2}$)';
    RegExp regExp = RegExp(patttern);
    if (value!.isEmpty) {
      return 'Пожалуйста заполните поле';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Не хватает цифр в номере';
    }
    return null;
  }

  static String? oTPCode(String? value){
    if (value!.length != 4) {
      return 'Пожалуйста заполните поле';
    }
    return null;
  }

  static String? nameAndSurname(String? value){
    if (value!.isEmpty) {
      return 'Пожалуйста заполните поле';
    }
    return null;
  }

  static String? email(String? value){
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Пожалуйста заполните поле';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Некорректно введена почта';
    }
    return null;
  }
}