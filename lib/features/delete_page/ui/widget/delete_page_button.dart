import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/delete_page/logic/delete_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeletePageButton extends StatelessWidget {
  const DeletePageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BloweBlocButton<DeletePageBloc, ElevatedButton, void>(
      onPressed: () => context.read<DeletePageBloc>().add(
            const BloweFetch(BloweNoParams()),
          ),
      text: AppLocalizations.of(context)!.delete,
    );
  }
}
