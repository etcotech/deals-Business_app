class ValidationErrors {
  final Map<String, List<String>> errors;

  ValidationErrors(this.errors);

  factory ValidationErrors.fromJson(Map<String, dynamic> json) {
    final errors = <String, List<String>>{};
    json.forEach((key, value) {
      errors[key] = List<String>.from(value);
    });
    return ValidationErrors(errors);
  }

  List<String>? getFieldErrors(String fieldName) {
    return errors[fieldName];
  }
}
/*
  String? _getFieldError(String fieldName) {
    if (_validationErrors != null) {
      final errors = _validationErrors!.getFieldErrors(fieldName);
      if (errors != null && errors.isNotEmpty) {
        return errors.join(', ');
      }
    }
    return null;
  }
*/