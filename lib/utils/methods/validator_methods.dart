class ValidatorMethods {
  static String? nameValidator(value) {
    if (value.isEmpty) {
      return 'Enter a valid name';
    } else {
      return null;
    }
  }

  static String? emailValidator(value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (value!.isEmpty) {
      return 'Enter a valid email address';
    }
    if (!regex.hasMatch(value)) {
      return 'Check your email address , again';
    } else {
      return null;
    }
  }

  static String? passwordValidator(value) {
    if (value.isEmpty) {
      return 'Enter a valid password';
    }
    if (value.length < 6) {
      return 'your password less than 6 items';
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(value, password) {
    if (value.isEmpty || value != password) {
      return 'password don`t match';
    } else {
      return null;
    }
  }
}
