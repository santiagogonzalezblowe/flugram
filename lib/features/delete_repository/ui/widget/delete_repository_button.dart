import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/delete_repository/logic/delete_repository_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteRepositoryButton extends StatelessWidget {
  const DeleteRepositoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BloweBlocButton<DeleteRepositoryBloc, ElevatedButton, void>(
      onPressed: () => context.read<DeleteRepositoryBloc>().add(
            const BloweFetch(BloweNoParams()),
          ),
      text: AppLocalizations.of(context)!.delete,
    );
  }
}
