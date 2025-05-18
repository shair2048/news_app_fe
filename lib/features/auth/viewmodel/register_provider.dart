import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/auth/viewmodel/register_viewmodel.dart';
import 'package:news_app_fe/features/auth/viewmodel/register_state.dart';

final registerProvider =
    StateNotifierProvider<RegisterViewModel, RegisterState>(
      (ref) => RegisterViewModel(),
    );
