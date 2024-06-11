import 'package:flugram/app/repositories/authentication_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

class ForgotPasswordBloc extends BloweLoadBloc<void, ForgotPasswordParams> {
  ForgotPasswordBloc(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<void> load(ForgotPasswordParams params) {
    return _authenticationRepository.sendPasswordResetEmail(
      params.email,
    );
  }
}

class ForgotPasswordParams {
  ForgotPasswordParams(this.email);

  final String email;
}
