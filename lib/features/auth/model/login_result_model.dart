class LoginResult {
  final String token;
  final String id;

  LoginResult({required this.token, required this.id});

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(token: json['token'], id: json['user']['_id']);
  }
}
