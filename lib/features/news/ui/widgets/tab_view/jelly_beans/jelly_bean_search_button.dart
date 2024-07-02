import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';
import 'package:flugram/features/jelly_bean/ui/page/jelly_bean_page.dart';
import 'package:flugram/features/news/logic/jelly_bean_search_bloc.dart';
import 'package:flugram/features/news/ui/widgets/tab_view/jelly_beans/jelly_bean_card.dart';
import 'package:flutter/material.dart';

class JellyBeanSearchButton extends StatelessWidget {
  const JellyBeanSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final result = await showSearch<JellyBeanModel?>(
          context: context,
          delegate: BloweSearchDelegate<JellyBeanSearchBloc, JellyBeanModel,
              JellyBeanSearchParams>(
            bloc: context.read<JellyBeanSearchBloc>(),
            searchFieldLabel: 'Group name',
            itemBuilder: (context, item, close, save) {
              return JellyBeanCard(
                item,
                onTap: () {
                  save(item);
                  close(context, item);
                },
              );
            },
            paramsProvider: JellyBeanSearchParams.new,
          ),
        );

        if (result != null) {
          JellyBeanPage.go(context, result.beanId);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No jelly bean selected'),
            ),
          );
        }
      },
      child: const Icon(Icons.search),
    );
  }
}
