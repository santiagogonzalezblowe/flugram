import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/enums/social_media_type.dart';
import 'package:flugram/app/repositories/authentication_repository.dart';

class SocialLoginBloc extends BloweLoadBloc<void, SocialMediaType> {
  SocialLoginBloc(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<void> load(SocialMediaType params) {
    switch (params) {
      case SocialMediaType.google:
        return _authenticationRepository.signInWithGoogle();
      case SocialMediaType.apple:
        return _authenticationRepository.signInWithApple();
    }
  }
}
