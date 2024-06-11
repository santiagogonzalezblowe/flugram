import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthStateChanges>(_onAuthStateChanges);

    FirebaseAuth.instance.authStateChanges().listen((user) {
      add(AuthStateChanges(user));
    });
  }

  void _onAuthStateChanges(
    AuthStateChanges event,
    Emitter<AuthenticationState> emit,
  ) {
    if (event.user != null) {
      emit(Authenticated(event.user!));
    } else {
      emit(Unauthenticated());
    }
  }
}
