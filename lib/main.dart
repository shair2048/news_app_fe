import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/themes/app_theme.dart';
import 'package:news_app_fe/features/auth/view/pages/login_page.dart';
// import 'package:news_app_fe/features/auth/view/pages/register_page.dart';

// final helloWorldProvider = Provider((_) => 'Hello world');

void main() {
  runApp(ProviderScope(child: NewsApp()));
}

class NewsApp extends ConsumerWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.darkThemeMode,
      home: LoginPage(),
    );
  }
}
