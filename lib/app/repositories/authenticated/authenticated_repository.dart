import 'package:firebase_auth/firebase_auth.dart';
import 'package:flugram/app/repositories/authentication_repository.dart';

abstract class AuthenticatedRepository {
  AuthenticatedRepository(this._authenticationRepository)
      : assert(
          _authenticationRepository.currentUser != null,
          'Cannot create an AuthenticatedRepository without a signed in user',
        );

  final AuthenticationRepository _authenticationRepository;

  User get currentUser => _authenticationRepository.currentUser!;

  String get userId => currentUser.uid;
}
