// Password Validator
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // Email Validator
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }
  // Name Validator
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } 
    return null;
  }
