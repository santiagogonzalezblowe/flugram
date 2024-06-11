import 'package:flugram/features/edit_bloc/ui/page/edit_bloc_page.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flutter/material.dart';

class EditBlocItem extends StatelessWidget {
  const EditBlocItem({
    super.key,
    required this.bloc,
  });

  final BlocModel bloc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(bloc.name),
      subtitle: Text(bloc.description),
      trailing: const Icon(Icons.edit),
      onTap: () async {
        await showGeneralDialog(
          context: context,
          pageBuilder: (context, animation, secondaryAnimation) {
            return EditBlocPage(
              bloc: bloc,
            );
          },
        );
      },
    );
  }
}
