part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class Authenticated extends AuthenticationState {
  const Authenticated(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

final class Unauthenticated extends AuthenticationState {}
