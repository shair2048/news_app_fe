abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure({required super.message});
}

class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});
}
