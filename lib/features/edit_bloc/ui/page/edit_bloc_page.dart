import 'package:flugram/features/edit_bloc/logic/edit_bloc_blocs_provider.dart';
import 'package:flugram/features/edit_bloc/logic/edit_bloc_listener.dart';
import 'package:flugram/features/edit_bloc/ui/widgets/edit_bloc_form.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flutter/material.dart';

class EditBlocPage extends StatelessWidget {
  const EditBlocPage({
    super.key,
    required this.bloc,
  });

  final BlocModel bloc;

  @override
  Widget build(BuildContext context) {
    return EditBlocBlocsProvider(
      child: EditBlocListener(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit Bloc'),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            children: [
              EditBlocForm(
                bloc: bloc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
