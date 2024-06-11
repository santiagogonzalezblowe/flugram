import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flugram/features/update_page/logic/update_page_bloc.dart';
import 'package:flugram/features/update_page/ui/widgets/edit_bloc_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocsExpansionTile extends StatelessWidget {
  const BlocsExpansionTile({
    super.key,
    required this.blocs,
    required this.onCreateNewBloc,
  });

  final List<BlocModel> blocs;
  final Function() onCreateNewBloc;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(bottom: 16),
      title: const Row(
        children: [
          Icon(Icons.settings),
          SizedBox(width: 16),
          Text('Blocs'),
        ],
      ),
      children: [
        ...blocs.map((bloc) {
          return EditBlocItem(bloc: bloc);
        }),
        BloweBlocButton<UpdatePageBloc, ElevatedButton>(
          onPressed: onCreateNewBloc,
          text: AppLocalizations.of(context)!.createNewBloc,
        ),
      ],
    );
  }
}
