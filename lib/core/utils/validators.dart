class Validators {
  static String? validateEmail(String email) {
    if (email.trim().isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.trim().isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  // Legacy methods for backward compatibility
  static bool isValidEmail(String email) => validateEmail(email) == null;
  static bool isValidPassword(String password) =>
      validatePassword(password) == null;
}
