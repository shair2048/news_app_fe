import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:news_app_fe/core/themes/app_theme.dart';
import 'package:news_app_fe/features/auth/view/pages/login_page.dart';
import 'package:news_app_fe/features/auth/view/pages/register_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(ProviderScope(child: NewsApp()));
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterPage();
          },
        ),
      ],
    ),
  ],
);

class NewsApp extends ConsumerWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.darkThemeMode,
      // home: LoginPage(),
      routerConfig: _router,
    );
  }
}
