class LoginState {
  // dữ liệu thuần - đại diện cho trạng thái hiện tại của màn hình
  final String email;
  final String password;

  // default values
  LoginState({this.email = '', this.password = ''});

  LoginState copyWith({String? email, String? password}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  // initial values
  factory LoginState.initial() {
    return LoginState(email: '', password: '');
  }

  bool get isValid => email.trim().isNotEmpty && password.trim().isNotEmpty;
  bool get isEmailValid =>
      RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}').hasMatch(email);
  bool get isPasswordValid => RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%\^&\*])[a-zA-Z\d!@#\$%\^&\*]{8,}$',
  ).hasMatch(password);
}
