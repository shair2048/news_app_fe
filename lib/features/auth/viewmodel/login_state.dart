class LoginState {
  // dữ liệu thuần - đại diện cho trạng thái hiện tại của màn hình
  final String email;
  final String password;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final String errorMessage;

  LoginState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.isError = false,
    this.errorMessage = '',
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isValid => email.trim().isNotEmpty && password.trim().isNotEmpty;
  bool get isEmailValid =>
      RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}').hasMatch(email);
  bool get isPasswordValid => RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%\^&\*])[a-zA-Z\d!@#\$%\^&\*]{8,}$',
  ).hasMatch(email);
}
