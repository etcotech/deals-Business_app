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

class NetworkFailure extends Failure {
  final String? message;
  NetworkFailure({ this.message}):super(message: message);

}

class ExceptionFailure extends Failure {
  final String? message;
  ExceptionFailure({ this.message}):super(message: message);
}

class CredentialFailure extends Failure {
    final String? message;
  CredentialFailure({ this.message}):super(message: message);
}
class TimeoutFailure extends Failure {
   final String? message;
  TimeoutFailure({ this.message}):super(message: message);
}

class AuthenticationFailure extends Failure {
  final String? message;
  AuthenticationFailure({ this.message}):super(message: message);
}

