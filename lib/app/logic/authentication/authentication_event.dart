part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AuthStateChanges extends AuthenticationEvent {
  const AuthStateChanges(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}
