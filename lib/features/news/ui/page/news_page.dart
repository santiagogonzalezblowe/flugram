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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.news),
      ),
      body: const Center(
        child: Text('Coming soon...'),
      ),
    );
  }
}
