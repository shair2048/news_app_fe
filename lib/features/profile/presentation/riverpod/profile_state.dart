import 'package:news_app_fe/features/profile/data/models/user_model.dart';

class ProfileState {
  final UserModel user;
  final bool isDarkMode;
  final bool isLoading;

  ProfileState({
    UserModel? user,
    this.isDarkMode = false,
    this.isLoading = false,
  }) : user =
           user ??
           UserModel(name: 'unknown_user', email: 'unknown_user@gmail.com');

  ProfileState copyWith({UserModel? user, bool? isDarkMode, bool? isLoading}) {
    return ProfileState(
      user: user ?? this.user,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
