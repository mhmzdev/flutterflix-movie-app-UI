import 'package:form_builder_validators/form_builder_validators.dart';

class Validator {
  static String? Function(String?) email() {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: 'Email cannot be empty.'),
      FormBuilderValidators.email(
          errorText: 'Invalid email address, please check again.'),
    ]);
  }

  static String? Function(String?) name() {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: 'Full name cannot be empty.'),
      FormBuilderValidators.minLength(2,
          errorText: 'Name cannot be less than 2 characters'),
      (String? value) {
        if (value != null && containsSymbol(value)) {
          return 'Name cannot have symbols in it.';
        }
        return null;
      },
      (String? value) {
        if (value != null && containsNumeric(value)) {
          return 'Name cannot have numeric values in it.';
        }
        return null;
      }
    ]);
  }

  static bool containsSymbol(String input) {
    RegExp regExp = RegExp(r'[^\w\s]');
    return regExp.hasMatch(input);
  }

  static bool containsNumeric(String input) {
    RegExp regExp = RegExp(r'\d');
    return regExp.hasMatch(input);
  }
}
