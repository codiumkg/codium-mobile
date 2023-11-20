part of 'authorization_bloc.dart';

abstract class AuthorizationEvent {}

class LoadAuthorization extends AuthorizationEvent {
  final String username;
  final String password;

  LoadAuthorization({required this.username, required this.password});
}
