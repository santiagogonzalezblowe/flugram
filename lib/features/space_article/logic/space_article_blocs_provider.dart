import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/space/space_repository.dart';
import 'package:flugram/features/space_article/logic/space_article_bloc.dart';
import 'package:flutter/material.dart';

class SpaceArticleBlocsProvider extends StatelessWidget {
  const SpaceArticleBlocsProvider({
    super.key,
    required this.child,
    required this.articleId,
  });

  final Widget child;
  final int articleId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SpaceArticleBloc(
            context.read<SpaceRepository>(),
          )..add(BloweFetch(articleId)),
        ),
      ],
      child: child,
    );
  }
}
