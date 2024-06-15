import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/news/logic/jelly_beans_bloc.dart';
import 'package:flugram/features/news/ui/widgets/tab_view/jelly_beans/jelly_bean_card.dart';
import 'package:flugram/features/news/ui/widgets/tab_view/jelly_beans/jelly_beans_tab_view_blocs_provider.dart';
import 'package:flutter/material.dart';

class JellyBeansTabView extends StatefulWidget {
  const JellyBeansTabView({super.key});

  @override
  State<JellyBeansTabView> createState() => _JellyBeansTabViewState();
}

class _JellyBeansTabViewState extends State<JellyBeansTabView>
    with AutomaticKeepAliveClientMixin<JellyBeansTabView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return JellyBeansTabViewBlocsProvider(
      child: BlowePaginationListView<JellyBeansBloc, JellyBeanModel>(
        padding: const EdgeInsets.only(top: 12),
        itemBuilder: (context, item) => JellyBeanCard(item),
      ),
    );
  }
}
