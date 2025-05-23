class LoginState {
  // dữ liệu thuần - đại diện cho trạng thái hiện tại của màn hình
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;

  // default values
  LoginState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
    );
  }

  // initial values
  factory LoginState.initial() {
    return LoginState(email: '', password: '');
  }

  bool get isValid => email.trim().isNotEmpty && password.trim().isNotEmpty;
}
