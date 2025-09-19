import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/shared/presentation/widgets/common_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_fe/features/auth/presentation/pages/login_page.dart';
import 'package:news_app_fe/features/auth/presentation/pages/register_page.dart';
import 'package:news_app_fe/features/bookmark/view/pages/bookmark_page.dart';
import 'package:news_app_fe/features/category/view/pages/category_page.dart';
import 'package:news_app_fe/features/home/presentation/pages/home_page.dart';
import 'package:news_app_fe/features/profile/presentation/pages/profile_page.dart';
import 'package:news_app_fe/features/search/presentation/pages/search_page.dart';
import 'package:news_app_fe/features/article_detail/presentation/pages/article_detail_page.dart';
import 'package:logging/logging.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      // Log to console in debug mode
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });

  runApp(ProviderScope(child: NewsApp()));
}

/// The route configuration.
final GoRouter _router = GoRouter(
  initialLocation: '/home',

  routes: <RouteBase>[
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),

    /// ShellRoute - bottom navigation
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(body: child, bottomNavigationBar: CommonBottomNavBar());
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/category',
          name: 'category',
          builder: (context, state) => const CategoryPage(),
        ),
        GoRoute(
          path: '/search',
          name: 'search',
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          path: '/bookmark',
          name: 'bookmark',
          builder: (context, state) => const BookmarkPage(),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: '/article_detail/:id',
          builder: (context, state) {
            String articleId = state.pathParameters['id']!;

            return ArticleDetailPage(articleId: articleId);
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
