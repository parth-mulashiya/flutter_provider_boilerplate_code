class FormValidator {
  static FormValidator? _instance;

  factory FormValidator() => _instance ??= const FormValidator._();

  const FormValidator._();

  String? validatePhone(String? value) {
    String pattern = r'(^[6-9]{1}[0-9]{9})';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "This field is required";
    } else if (value.length != 10) {
      return "Phone number must be 10 digits.";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter valid mobile number";
    }
    return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r'(\D)+(\w)*((\.(\w)+)?)+@(\D)+(\w)*((\.(\D)+(\w)*)+)?(\.)[a-z]{2,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Email is required";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Password is required";
    } else {
      return null;
    }
  }

  String? validateDOB(String value) {
    // String pattern =
    //     r'/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/';
    String pattern1 =
        r'(^((((0[1-9])|([1-2][0-9])|(3[0-1]))|([1-9]))-(((0[1-9])|(1[0-2]))|([1-9]))-(([0-9]{2})|(((19)|([2]([0]{1})))([0-9]{2}))))$)';
    RegExp regExp = RegExp(pattern1);
    if (value.isEmpty) {
      return "This field is required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalide Date - Must be DD-MM-YYYY";
    }
    return null;
  }

  String? validateRequired(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  String? validateDropdownRequired(dynamic value) {
    if (value == null) {
      return "This field is required";
    }
    return null;
  }
}
