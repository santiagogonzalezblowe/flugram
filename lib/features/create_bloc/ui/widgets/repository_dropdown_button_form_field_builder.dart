import 'package:flugram/app/widgets/dropdown/repository_dropdown_button_form_field.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/create_bloc/logic/repositories_load_bloc.dart';
import 'package:flugram/features/home/models/repository_model.dart';
import 'package:flutter/material.dart';

class RepositoryDropdownButtonFormFieldBuilder extends StatelessWidget {
  const RepositoryDropdownButtonFormFieldBuilder({
    super.key,
    required this.enabled,
    required this.onChanged,
    this.value,
  });

  final bool enabled;
  final Function(RepositoryModel? repository) onChanged;
  final RepositoryModel? value;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoriesLoadBloc, BloweBlocState>(
      builder: (context, state) {
        if (state is BloweError) {
          return Center(
            child: Text(state.error.toString()),
          );
        }

        final items = <RepositoryModel>[];

        if (state is BloweCompleted<List<RepositoryModel>>) {
          items.addAll(state.data);
        }

        return RepositoryDropdownButtonFormField(
          items: items,
          onChanged: onChanged,
          enabled: enabled,
          value: value,
          suffixIcon: (context) {
            if (state is BloweInProgress) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            }
            return null;
          },
          icon: (context) {
            if (state is BloweInProgress) {
              return const SizedBox.shrink();
            }
            return null;
          },
        );
      },
    );
  }
}
