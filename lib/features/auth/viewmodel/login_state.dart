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
}
