class RegisterState {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;

  const RegisterState({
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
  });

  RegisterState copyWith({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
  }) {
    return RegisterState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }

  // initial values
  factory RegisterState.initial() {
    return RegisterState(
      fullName: '',
      email: '',
      password: '',
      confirmPassword: '',
    );
  }

  bool get isValid =>
      fullName.trim().isNotEmpty &&
      email.trim().isNotEmpty &&
      password.trim().isNotEmpty &&
      confirmPassword.trim().isNotEmpty;
}
