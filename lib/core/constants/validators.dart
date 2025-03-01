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

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title cannot be empty';
    } 
    return null;
  }

  String? descValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Description cannot be empty';
    } 
    if (value.length<5) {
      return 'too short';
    }
    return null;
  }

  String? priceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Price cannot be empty';
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
