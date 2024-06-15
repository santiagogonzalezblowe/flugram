import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/ui/page/flugram_page.dart';
import 'package:flugram/features/home/logic/flugrams_bloc.dart';
import 'package:flugram/features/home/models/flugram_model.dart';
import 'package:flugram/features/home/ui/widgets/flugram_search_delegate.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    super.key,
  }) : super(
          title: const Text('Flugram'),
          actions: [
            BlocBuilder<FlugramsBloc, BloweState>(
              builder: (context, state) {
                if (state is BloweCompleted<List<FlugramModel>>) {
                  return IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      final flugramId = await showSearch<String>(
                        context: context,
                        delegate: FlugramSearchDelegate(context, state.data),
                      );

                      if (flugramId != null && flugramId.isNotEmpty) {
                        FlugramPage.go(context, flugramId);
                      }
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        );
}
