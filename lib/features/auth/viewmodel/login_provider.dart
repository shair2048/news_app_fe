import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/auth/viewmodel/login_state.dart';
import 'package:news_app_fe/features/auth/viewmodel/login_viewmodel.dart';

final loginProvider = StateNotifierProvider<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(),
);
