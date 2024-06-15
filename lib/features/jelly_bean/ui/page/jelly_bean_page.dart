import 'package:flugram/features/jelly_bean/logic/jelly_bean_blocs_provider.dart';
import 'package:flugram/features/jelly_bean/ui/widgets/jelly_bean_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JellyBeanPage extends StatelessWidget {
  const JellyBeanPage(this.beanId, {super.key});

  static String get routePath => 'jelly-bean/:beanId';
  static String get routeName => 'jellyBean';

  static void go(BuildContext context, int beanId) => context.goNamed(
        routeName,
        pathParameters: {'beanId': beanId.toString()},
      );

  final int beanId;

  @override
  Widget build(BuildContext context) {
    return JellyBeanBlocsProvider(
      beanId: beanId,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        body: const JellyBeanBuilder(),
      ),
    );
  }
}
