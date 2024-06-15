import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authentication_repository.dart';

class LoginBloc extends BloweLoadBloc<void, LoginParams> {
  LoginBloc(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<void> load(LoginParams params) {
    return _authenticationRepository.signInWithEmailAndPassword(
      params.email,
      params.password,
    );
  }
}

class LoginParams {
  LoginParams(
    this.email,
    this.password,
  );

  final String email;
  final String password;
}
