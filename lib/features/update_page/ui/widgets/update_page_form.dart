import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/widgets/text_form_field/page/page_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/page/page_name_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/page/page_path_text_form_field.dart';
import 'package:flugram/features/delete_page/ui/page/delete_page_page.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flugram/features/update_page/logic/update_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdatePageForm extends StatefulWidget {
  const UpdatePageForm({
    super.key,
    required this.page,
    required this.flugramId,
  });

  final PageModel page;
  final String flugramId;

  @override
  State<UpdatePageForm> createState() => _UpdatePageFormState();
}

class _UpdatePageFormState extends State<UpdatePageForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _pathController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.page.name);
    _descriptionController =
        TextEditingController(text: widget.page.description);
    _pathController = TextEditingController(text: widget.page.path);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BloweBlocSelector<UpdatePageBloc, void>(
            builder: (context, enabled) => PageNameTextFormField(
              controller: _nameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<UpdatePageBloc, void>(
            builder: (context, enabled) => PageDescriptionTextFormField(
              controller: _descriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<UpdatePageBloc, void>(
            builder: (context, enabled) => PagePathTextFormField(
              controller: _pathController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                context.read<UpdatePageBloc>().add(
                      BloweFetch(updatePageParams),
                    );
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<UpdatePageBloc, ElevatedButton, void>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<UpdatePageBloc>().add(
                    BloweFetch(updatePageParams),
                  );
            },
            text: AppLocalizations.of(context)!.save,
          ),
          // const SizedBox(height: 16),
          // BlocsExpansionTile(
          //   blocs: page.blocs,
          //   onCreateNewBloc: () {
          //     // context.read<EditPageBloc>().add(BloweFetch(createNewBlocParams));
          //   },
          // ),
          // const SizedBox(height: 16),
          // SubpagesExpansionTile(
          //   subpages: page.subpages,
          //   onCreateNewPage: () {
          //     // context.read<EditPageBloc>().add(BloweFetch(createNewPageParams));
          //   },
          // ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          BloweBlocButton<UpdatePageBloc, ElevatedButton, void>(
            onPressed: () => DeletePagePage.go(
              context,
              widget.flugramId,
              widget.page.id,
            ),
            text: AppLocalizations.of(context)!.delete,
          ),
        ],
      ),
    );
  }

  PageModel get updatePageParams => widget.page.copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
        path: _pathController.text,
      );

  // AppModel get deletePageParams => widget.app.copyWith(
  //       pages: widget.app.pages.where((p) => p.id != widget.page.id).toList(),
  //     );

  // AppModel get editPageParams => widget.app.copyWith(
  //       pages: widget.app.pages.map((p) {
  //         if (p.id == widget.page.id) {
  //           return widget.page.copyWith(
  //             name: _nameController.text,
  //             description: _descriptionController.text,
  //             path: _pathController.text,
  //           );
  //         }
  //         return p;
  //       }).toList(),
  //     );

  // AppModel get createNewBlocParams => editPageParams.copyWith(
  //       pages: editPageParams.pages.map((p) {
  //         if (p.id == widget.page.id) {
  //           return widget.page.copyWith(
  //             blocs: [
  //               ...widget.page.blocs,
  //               BlocModel(
  //                 id: const Uuid().v4(),
  //                 name: 'New Bloc',
  //                 description: 'This is a new bloc',
  //                 repositories: [],
  //               ),
  //             ],
  //           );
  //         }
  //         return p;
  //       }).toList(),
  //     );

  // AppModel get createNewPageParams => editPageParams.copyWith(
  //       pages: editPageParams.pages.map((p) {
  //         if (p.id == widget.page.id) {
  //           return widget.page.copyWith(
  //             subpages: [
  //               ...widget.page.subpages,
  //               PageModel(
  //                 id: const Uuid().v4(),
  //                 name: 'New Page',
  //                 description: 'This is a new page',
  //                 path: 'new-page',
  //                 blocs: [],
  //                 subpages: [],
  //               ),
  //             ],
  //           );
  //         }
  //         return p;
  //       }).toList(),
  //     );
}
