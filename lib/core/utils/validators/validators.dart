// lib/core/utils/validator.dart

class Validator {
  // ✅ التحقق من البريد الإلكتروني
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    // صيغة عامة لأي بريد إلكتروني
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$');
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  // ✅ التحقق من كلمة المرور (للتسجيل أو تسجيل الدخول)
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < minLength) {
      return "Password must be at least $minLength characters long";
    }
    return null;
  }

  // ✅ التحقق من الاسم الأول (لإنشاء الحساب فقط)
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "First name is required";
    }
    if (value.length < 2) {
      return "First name must be at least 2 characters";
    }
    return null;
  }

  // ✅ التحقق من الاسم الأخير (لإنشاء الحساب فقط)
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Last name is required";
    }
    if (value.length < 2) {
      return "Last name must be at least 2 characters";
    }
    return null;
  }
}
