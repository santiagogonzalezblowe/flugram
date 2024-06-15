import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/delete_bloc/logic/delete_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteBlocButton extends StatelessWidget {
  const DeleteBlocButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BloweBlocButton<DeleteBlocBloc, ElevatedButton>(
      onPressed: () => context.read<DeleteBlocBloc>().add(
            const BloweFetch(BloweNoParams()),
          ),
      text: AppLocalizations.of(context)!.delete,
    );
  }
}
