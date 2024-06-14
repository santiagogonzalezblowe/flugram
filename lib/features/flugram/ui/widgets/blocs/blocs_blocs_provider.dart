import 'package:flugram/app/repositories/authenticated/blocs_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/logic/blocs_bloc.dart';
import 'package:flutter/material.dart';

class BlocsBlocsProvider extends StatelessWidget {
  const BlocsBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
    required this.parentPageIds,
  });

  final Widget child;
  final String flugramId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocsBloc(
        context.read<BlocsRepository>(),
        flugramId,
        parentPageIds,
      )..add(const BloweFetch(BloweNoParams())),
      child: child,
    );
  }
}
