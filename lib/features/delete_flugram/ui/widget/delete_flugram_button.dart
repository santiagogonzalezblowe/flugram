import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/delete_flugram/logic/delete_flugram_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteFlugramButton extends StatelessWidget {
  const DeleteFlugramButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BloweBlocButton<DeleteFlugramBloc, ElevatedButton>(
      onPressed: () => context.read<DeleteFlugramBloc>().add(
            const BloweFetch(BloweNoParams()),
          ),
      text: AppLocalizations.of(context)!.delete,
    );
  }
}
