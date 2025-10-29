// lib/core/utils/validator.dart

class Validator {
  // ✅ التحقق من البريد الإلكتروني بصيغة example@domain.com
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    // صيغة صارمة: نص قبل @ ثم domain ثم .com
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.com$");
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email in the format example@domain.com";
    }
    return null;
  }

  // ✅ التحقق من كلمة المرور
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < minLength) {
      return "Password must be at least $minLength characters";
    }
    return null;
  }

  // ✅ التحقق من الاسم الأول
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "First name is required";
    }
    if (value.length < 2) {
      return "First name must be at least 2 characters";
    }
    return null;
  }

  // ✅ التحقق من الاسم الأخير
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Last name is required";
    }
    if (value.length < 2) {
      return "Last name must be at least 2 characters";
    }
    return null;
  }

  // ✅ التحقق من تأكيد كلمة المرور
  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm your password";
    }
    if (password != confirmPassword) {
      return "Passwords do not match";
    }
    return null;
  }

  // ✅ التحقق من رقم الهاتف (اختياري)
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return null; // إذا فارغ مقبول
    }
    final phoneRegex = RegExp(r'^\+?\d{7,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return "Enter a valid phone number";
    }
    return null;
  }
}
