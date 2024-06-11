import 'package:flugram/app/repositories/authentication_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

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
