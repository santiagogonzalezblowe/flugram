import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authentication_repository.dart';

class SignUpBloc extends BloweLoadBloc<void, SignUpParams> {
  SignUpBloc(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<void> load(SignUpParams params) {
    return _authenticationRepository.createUserWithEmailAndPassword(
      params.email,
      params.password,
    );
  }
}

class SignUpParams {
  SignUpParams(
    this.email,
    this.password,
  );

  final String email;
  final String password;
}
