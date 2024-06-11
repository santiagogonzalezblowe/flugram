import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flugram/features/update_page/logic/update_page_bloc.dart';
import 'package:flugram/features/update_page/ui/widgets/edit_subpage_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubpagesExpansionTile extends StatelessWidget {
  const SubpagesExpansionTile({
    super.key,
    required this.subpages,
    required this.onCreateNewPage,
  });

  final List<PageModel> subpages;
  final Function() onCreateNewPage;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(bottom: 16),
      title: const Row(
        children: [
          Icon(Icons.pages),
          SizedBox(width: 16),
          Text('Subpages'),
        ],
      ),
      children: [
        ...subpages.map((subpage) {
          return EditSubpageItem(subpage: subpage);
        }),
        BloweBlocButton<UpdatePageBloc, ElevatedButton>(
          onPressed: onCreateNewPage,
          text: AppLocalizations.of(context)!.createPage,
        ),
      ],
    );
  }
}
