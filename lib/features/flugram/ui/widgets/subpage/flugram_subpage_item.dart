import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/logic/subpage_watch_bloc.dart';
import 'package:flugram/features/flugram/ui/widgets/subpage/flugram_subpage_blocs_provider.dart';
import 'package:flugram/features/flugram/ui/widgets/subpage/flugram_subpage_card.dart';
import 'package:flugram/features/flugram/ui/widgets/subpage/flugram_subpage_listener.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flutter/material.dart';

class AppSubpageItem extends StatelessWidget {
  const AppSubpageItem({
    super.key,
    required this.subpage,
    required this.onGoPressed,
    required this.onPopPressed,
    required this.flugramId,
  });

  final String flugramId;
  final PageModel subpage;
  final Function(PageModel subpage) onGoPressed;
  final Function() onPopPressed;

  @override
  Widget build(BuildContext context) {
    return FlugramSubpageBlocsProvider(
      flugramId: flugramId,
      pageId: subpage.id,
      parentPageIds: subpage.parentPageIds,
      child: FlugramSubpageListener(
        onPopPressed: onPopPressed,
        child: BlocBuilder<SubpageWatchBloc, BloweBlocState>(
          builder: (context, state) {
            if (state is BloweInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is BloweCompleted<PageModel>) {
              return FlugramSubpageCard(
                flugramId: flugramId,
                subpage: state.data,
                onGoPressed: onGoPressed,
                onPopPressed: onPopPressed,
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
