class LoginResult {
  final String token;
  final String name;
  final String email;

  LoginResult({required this.token, required this.name, required this.email});

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      token: json['token'],
      name: json['user']['name'],
      email: json['user']['email'],
    );
  }
}
