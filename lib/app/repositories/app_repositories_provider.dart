import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flugram/app/repositories/authenticated/bloc_repository.dart';
import 'package:flugram/app/repositories/authenticated/blocs_repository.dart';
import 'package:flugram/app/repositories/authenticated/flugram_repository.dart';
import 'package:flugram/app/repositories/authenticated/flugrams_repository.dart';
import 'package:flugram/app/repositories/authenticated/page_repository.dart';
import 'package:flugram/app/repositories/authenticated/pages_repository.dart';
import 'package:flugram/app/repositories/authenticated/repositories_repository.dart';
import 'package:flugram/app/repositories/authenticated/repository_repository.dart';
import 'package:flugram/app/repositories/authenticated/subpage_repository.dart';
import 'package:flugram/app/repositories/authenticated/subpages_repository.dart';
import 'package:flugram/app/repositories/authentication_repository.dart';
import 'package:flugram/app/repositories/jelly_bean/jelly_bean_repository.dart';
import 'package:flugram/app/repositories/space/space_repository.dart';
import 'package:flugram/app/services/jelly_bean/jelly_bean_service.dart';
import 'package:flugram/app/services/space/space_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _authenticationRepository = AuthenticationRepository(
  FirebaseAuth.instance,
  GoogleSignIn(),
  FirebaseFirestore.instance,
);

class AppRepositoriesProvider extends StatelessWidget {
  const AppRepositoriesProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => _authenticationRepository),
        RepositoryProvider(
          create: (context) => FlugramsRepository(
            FirebaseFirestore.instance,
            _authenticationRepository,
          ),
        ),
        RepositoryProvider(
          create: (context) => FlugramRepository(
            FirebaseFirestore.instance,
            _authenticationRepository,
          ),
        ),
        RepositoryProvider(
          create: (context) => PagesRepository(
            FirebaseFirestore.instance,
            _authenticationRepository,
          ),
        ),
        RepositoryProvider(
          create: (context) => PageRepository(
            FirebaseFirestore.instance,
            _authenticationRepository,
          ),
        ),
        RepositoryProvider(
          create: (context) => RepositoriesRepository(
            FirebaseFirestore.instance,
            _authenticationRepository,
          ),
        ),
        RepositoryProvider(
          create: (context) => RepositoryRepository(
            FirebaseFirestore.instance,
            _authenticationRepository,
          ),
        ),
        RepositoryProvider(
          create: (context) => SubpagesRepository(
            FirebaseFirestore.instance,
            _authenticationRepository,
          ),
        ),
        RepositoryProvider(
          create: (context) => SubpageRepository(
            FirebaseFirestore.instance,
            _authenticationRepository,
          ),
        ),
        RepositoryProvider(
          create: (context) => BlocsRepository(
            FirebaseFirestore.instance,
            _authenticationRepository,
          ),
        ),
        RepositoryProvider(
          create: (context) => BlocRepository(
            FirebaseFirestore.instance,
            _authenticationRepository,
          ),
        ),
        RepositoryProvider(
          create: (context) => SpaceRepository(
            context.read<SpaceService>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => JellyBeanRepository(
            context.read<JellyBeanService>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
