import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  Failure({ this.message});
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  final String? message;
  ServerFailure({ this.message}):super(message: message);

}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class ExceptionFailure extends Failure {}

class CredentialFailure extends Failure {
    final String? message;
  CredentialFailure({ this.message}):super(message: message);
}
class TimeoutFailure extends Failure {}

class AuthenticationFailure extends Failure {}