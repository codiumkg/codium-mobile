part of 'authorization_bloc.dart';

abstract class AuthorizationState {}

class AuthorizationInitial extends AuthorizationState {}

class AuthorizationLoading extends AuthorizationState {}

class AuthorizationSuccess extends AuthorizationState {}

class AuthorizationFailure extends AuthorizationState {
  final dynamic error;

  AuthorizationFailure({required this.error});
}
