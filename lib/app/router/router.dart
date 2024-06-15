import 'package:firebase_auth/firebase_auth.dart';
import 'package:flugram/app/widgets/bottom_navigation_scaffold.dart';
import 'package:flugram/features/create_bloc/ui/page/create_bloc_page.dart';
import 'package:flugram/features/create_flugram/ui/page/create_flugram_page.dart';
import 'package:flugram/features/create_page/ui/page/create_page_page.dart';
import 'package:flugram/features/create_repository/ui/page/create_repository_page.dart';
import 'package:flugram/features/create_subpage/ui/page/create_subpage_page.dart';
import 'package:flugram/features/delete_bloc/ui/page/delete_bloc_page.dart';
import 'package:flugram/features/delete_flugram/ui/page/delete_flugram_page.dart';
import 'package:flugram/features/delete_page/ui/page/delete_page_page.dart';
import 'package:flugram/features/delete_repository/ui/page/delete_repository_page.dart';
import 'package:flugram/features/delete_subpage/ui/page/delete_subpage_page.dart';
import 'package:flugram/features/flugram/ui/page/flugram_page.dart';
import 'package:flugram/features/forgot_password/ui/page/forgot_password_page.dart';
import 'package:flugram/features/home/ui/page/home_page.dart';
import 'package:flugram/features/jelly_bean/ui/page/jelly_bean_page.dart';
import 'package:flugram/features/login/ui/page/login_page.dart';
import 'package:flugram/features/news/ui/page/news_page.dart';
import 'package:flugram/features/sign_up/ui/page/sign_up_page.dart';
import 'package:flugram/features/space_article/ui/page/space_article_page.dart';
import 'package:flugram/features/update_bloc/ui/page/update_bloc_page.dart';
import 'package:flugram/features/update_flugram/ui/page/update_flugram_page.dart';
import 'package:flugram/features/update_page/ui/page/update_page_page.dart';
import 'package:flugram/features/update_repository/ui/page/update_repository_page.dart';
import 'package:flugram/features/update_subpage/ui/page/update_subpage_page.dart';
import 'package:go_router/go_router.dart';

GoRouter get goRouter {
  final auth = FirebaseAuth.instance;
  return GoRouter(
    initialLocation:
        auth.currentUser != null ? HomePage.routePath : LoginPage.routePath,
    routes: [
      GoRoute(
        path: LoginPage.routePath,
        name: LoginPage.routeName,
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
            path: SignUpPage.routePath,
            name: SignUpPage.routeName,
            builder: (context, state) => const SignUpPage(),
          ),
          GoRoute(
            path: ForgotPasswordPage.routePath,
            name: ForgotPasswordPage.routeName,
            builder: (context, state) => const ForgotPasswordPage(),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => ShellScaffold(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: HomePage.routePath,
                name: HomePage.routeName,
                builder: (context, state) => const HomePage(),
                routes: [
                  GoRoute(
                    path: CreateFlugramPage.routePath,
                    name: CreateFlugramPage.routeName,
                    builder: (context, state) => const CreateFlugramPage(),
                  ),
                  GoRoute(
                    path: FlugramPage.routePath,
                    name: FlugramPage.routeName,
                    builder: (context, state) {
                      final flugramId = state.pathParameters['flugramId']!;
                      return FlugramPage(flugramId);
                    },
                    routes: [
                      GoRoute(
                        path: UpdateFlugramPage.routePath,
                        name: UpdateFlugramPage.routeName,
                        builder: (context, state) {
                          final flugramId = state.pathParameters['flugramId']!;
                          return UpdateFlugramPage(flugramId);
                        },
                        routes: [
                          GoRoute(
                            path: DeleteFlugramPage.routePath,
                            name: DeleteFlugramPage.routeName,
                            builder: (context, state) {
                              final flugramId =
                                  state.pathParameters['flugramId']!;
                              return DeleteFlugramPage(flugramId);
                            },
                          ),
                        ],
                      ),
                      GoRoute(
                        path: CreatePagePage.routePath,
                        name: CreatePagePage.routeName,
                        builder: (context, state) {
                          final flugramId = state.pathParameters['flugramId']!;
                          return CreatePagePage(flugramId: flugramId);
                        },
                      ),
                      GoRoute(
                        path: CreateSubpagePage.routePath,
                        name: CreateSubpagePage.routeName,
                        builder: (context, state) {
                          final flugramId = state.pathParameters['flugramId']!;
                          final parentPageIds =
                              state.pathParameters['parentPageIds']!.split(',');

                          return CreateSubpagePage(
                            flugramId: flugramId,
                            parentPageIds: parentPageIds,
                          );
                        },
                      ),
                      GoRoute(
                        path: CreateBlocPage.routePath,
                        name: CreateBlocPage.routeName,
                        builder: (context, state) {
                          final flugramId = state.pathParameters['flugramId']!;
                          final parentPageIds =
                              state.pathParameters['parentPageIds']!.split(',');

                          return CreateBlocPage(
                            flugramId: flugramId,
                            parentPageIds: parentPageIds,
                          );
                        },
                      ),
                      GoRoute(
                        path: UpdateBlocPage.routePath,
                        name: UpdateBlocPage.routeName,
                        builder: (context, state) {
                          final flugramId = state.pathParameters['flugramId']!;
                          final parentPageIds =
                              state.pathParameters['parentPageIds']!.split(',');
                          final blocId = state.pathParameters['blocId']!;

                          return UpdateBlocPage(
                            flugramId: flugramId,
                            parentPageIds: parentPageIds,
                            blocId: blocId,
                          );
                        },
                        routes: [
                          GoRoute(
                            path: DeleteBlocPage.routePath,
                            name: DeleteBlocPage.routeName,
                            builder: (context, state) {
                              final flugramId =
                                  state.pathParameters['flugramId']!;
                              final parentPageIds = state
                                  .pathParameters['parentPageIds']!
                                  .split(',');
                              final blocId = state.pathParameters['blocId']!;

                              return DeleteBlocPage(
                                flugramId: flugramId,
                                parentPageIds: parentPageIds,
                                blocId: blocId,
                              );
                            },
                          ),
                        ],
                      ),
                      GoRoute(
                        path: UpdateSubpagePage.routePath,
                        name: UpdateSubpagePage.routeName,
                        builder: (context, state) {
                          final flugramId = state.pathParameters['flugramId']!;
                          final parentPageIds =
                              state.pathParameters['parentPageIds']!.split(',');
                          final pageId = state.pathParameters['pageId']!;

                          return UpdateSubpagePage(
                            flugramId: flugramId,
                            parentPageIds: parentPageIds,
                            pageId: pageId,
                          );
                        },
                        routes: [
                          GoRoute(
                            path: DeleteSubpagePage.routePath,
                            name: DeleteSubpagePage.routeName,
                            builder: (context, state) {
                              final flugramId =
                                  state.pathParameters['flugramId']!;
                              final parentPageIds = state
                                  .pathParameters['parentPageIds']!
                                  .split(',');
                              final pageId = state.pathParameters['pageId']!;

                              return DeleteSubpagePage(
                                flugramId: flugramId,
                                parentPageIds: parentPageIds,
                                pageId: pageId,
                              );
                            },
                          ),
                        ],
                      ),
                      GoRoute(
                        path: CreateRepositoryPage.routePath,
                        name: CreateRepositoryPage.routeName,
                        builder: (context, state) {
                          final flugramId = state.pathParameters['flugramId']!;
                          return CreateRepositoryPage(flugramId: flugramId);
                        },
                      ),
                      GoRoute(
                        path: UpdatePagePage.routePath,
                        name: UpdatePagePage.routeName,
                        builder: (context, state) {
                          final flugramId = state.pathParameters['flugramId']!;
                          final pageId = state.pathParameters['pageId']!;
                          return UpdatePagePage(
                            pageId: pageId,
                            flugramId: flugramId,
                          );
                        },
                        routes: [
                          GoRoute(
                            path: DeletePagePage.routePath,
                            name: DeletePagePage.routeName,
                            builder: (context, state) {
                              final flugramId =
                                  state.pathParameters['flugramId']!;
                              final pageId = state.pathParameters['pageId']!;
                              return DeletePagePage(
                                pageId: pageId,
                                flugramId: flugramId,
                              );
                            },
                          ),
                        ],
                      ),
                      GoRoute(
                        path: UpdateRepositoryPage.routePath,
                        name: UpdateRepositoryPage.routeName,
                        builder: (context, state) {
                          final flugramId = state.pathParameters['flugramId']!;
                          final repositoryId =
                              state.pathParameters['repositoryId']!;
                          return UpdateRepositoryPage(
                            repositoryId: repositoryId,
                            flugramId: flugramId,
                          );
                        },
                        routes: [
                          GoRoute(
                            path: DeleteRepositoryPage.routePath,
                            name: DeleteRepositoryPage.routeName,
                            builder: (context, state) {
                              final flugramId =
                                  state.pathParameters['flugramId']!;
                              final repositoryId =
                                  state.pathParameters['repositoryId']!;
                              return DeleteRepositoryPage(
                                repositoryId: repositoryId,
                                flugramId: flugramId,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NewsPage.routePath,
                name: NewsPage.routeName,
                builder: (context, state) => const NewsPage(),
                routes: [
                  GoRoute(
                    path: SpaceArticlePage.routePath,
                    name: SpaceArticlePage.routeName,
                    builder: (context, state) {
                      final articleId = int.parse(
                        state.pathParameters['articleId']!,
                      );

                      return SpaceArticlePage(articleId);
                    },
                  ),
                  GoRoute(
                    path: JellyBeanPage.routePath,
                    name: JellyBeanPage.routeName,
                    builder: (context, state) {
                      final beanId = int.parse(
                        state.pathParameters['beanId']!,
                      );

                      return JellyBeanPage(beanId);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
