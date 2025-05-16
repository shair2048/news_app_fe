class RegisterState {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  final String? fullNameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;

  const RegisterState({
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.fullNameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
  });

  RegisterState copyWith({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
    String? fullNameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
  }) {
    return RegisterState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      fullNameError: fullNameError,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }
}
