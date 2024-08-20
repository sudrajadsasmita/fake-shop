import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  Failure(this.message);
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure(message) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(message) : super(message);
}

class NetworkFailure extends Failure {
  NetworkFailure(message) : super(message);
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure(message) : super(message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure(message) : super(message);
}
