import 'package:news_app_fe/features/profile/model/profile_model.dart';

class ProfileState {
  final ProfileUser user;
  final bool isDarkMode;
  final bool isLoading;

  ProfileState({
    ProfileUser? user,
    this.isDarkMode = false,
    this.isLoading = false,
  }) : user = user ?? ProfileUser(name: 'User', email: 'user@gmail.com');

  ProfileState copyWith({
    ProfileUser? user,
    bool? isDarkMode,
    bool? isLoading,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
