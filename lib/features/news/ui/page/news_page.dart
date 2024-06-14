import 'package:flugram/features/news/ui/widgets/tab_view/jelly_beans/jelly_beans_tab_view.dart';
import 'package:flugram/features/news/ui/widgets/tab_view/space/space_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  static String get routePath => '/news';
  static String get routeName => 'news';

  static void go(BuildContext context) => context.goNamed(routeName);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.news),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(icon: Icon(Icons.rocket_launch)),
              Tab(icon: Icon(Icons.fastfood)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SpaceTabView(),
            JellyBeansTabView(),
          ],
        ),
      ),
    );
  }
}
