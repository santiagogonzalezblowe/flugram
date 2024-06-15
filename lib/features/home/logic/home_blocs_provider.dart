import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/flugrams_repository.dart';
import 'package:flugram/features/home/logic/flugrams_bloc.dart';
import 'package:flutter/material.dart';

class HomeBlocsProvider extends StatelessWidget {
  const HomeBlocsProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FlugramsBloc(
            context.read<FlugramsRepository>(),
          )..add(const BloweFetch(BloweNoParams())),
        ),
      ],
      child: child,
    );
  }
}
