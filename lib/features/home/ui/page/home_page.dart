import 'package:flugram/app/logic/authentication/listener/authentication_listener.dart';
import 'package:flugram/features/home/logic/home_blocs_provider.dart';
import 'package:flugram/features/home/ui/widgets/create_app_floating_action_button.dart';
import 'package:flugram/features/home/ui/widgets/flugrams_list_view.dart';
import 'package:flugram/features/home/ui/widgets/home_app_bar.dart';
import 'package:flugram/features/home/ui/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String get routePath => '/';
  static String get routeName => 'home';

  static void go(BuildContext context) => context.goNamed(routeName);

  @override
  Widget build(BuildContext context) {
    return AuthenticationListener(
      child: HomeBlocsProvider(
        child: Scaffold(
          appBar: HomeAppBar(),
          drawer: const HomeDrawer(),
          body: const FlugramsListView(),
          floatingActionButton: const CreateAppFloatingActionButton(),
        ),
      ),
    );
  }
}
