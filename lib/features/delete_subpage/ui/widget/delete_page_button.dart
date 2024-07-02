import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/delete_subpage/logic/delete_subpage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteSubpageButton extends StatelessWidget {
  const DeleteSubpageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BloweBlocButton<DeleteSubpageBloc, ElevatedButton, void>(
      onPressed: () => context.read<DeleteSubpageBloc>().add(
            const BloweFetch(BloweNoParams()),
          ),
      text: AppLocalizations.of(context)!.delete,
    );
  }
}
