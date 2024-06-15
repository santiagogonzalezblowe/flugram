import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/home/models/flugram_model.dart';
import 'package:flugram/features/update_flugram/logic/flugram_load_bloc.dart';
import 'package:flugram/features/update_flugram/logic/update_flugram_blocs_provider.dart';
import 'package:flugram/features/update_flugram/logic/update_flugram_listener.dart';
import 'package:flugram/features/update_flugram/ui/widgets/update_flugram_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class UpdateFlugramPage extends StatelessWidget {
  const UpdateFlugramPage(
    this.flugramId, {
    super.key,
  });

  final String flugramId;

  static String get routePath => 'update-flugram';
  static String get routeName => 'updateFlugram';

  static void go(BuildContext context, String flugramId) => context.goNamed(
        routeName,
        pathParameters: {'flugramId': flugramId},
      );

  @override
  Widget build(BuildContext context) {
    return UpdateFlugramBlocsProvider(
      flugramId: flugramId,
      child: UpdateFlugramListener(
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<FlugramLoadBloc, BloweState>(
            builder: (context, state) {
              if (state is BloweCompleted<FlugramModel>) {
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  children: [
                    FormHeader(
                      illustration: Assets.illustrationsUpdate,
                      title: AppLocalizations.of(context)!.updateFlugram,
                      description: AppLocalizations.of(context)!
                          .updateFlugramDescription,
                    ),
                    const SizedBox(height: 32),
                    UpdateFlugramForm(flugram: state.data),
                  ],
                );
              }
              if (state is BloweInProgress) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is BloweError) {
                return Center(
                  child: Text(state.error.toString()),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
