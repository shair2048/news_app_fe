import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app_fe/core/widgets/common_app_bar.dart';
import '../riverpod/profile_provider.dart';
import '../riverpod/profile_state.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);
    final profileNotifier = ref.read(profileProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(appBarTitle: 'Profile'),
      body: switch (profileState) {
        ProfileInitial() => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome! Load your profile to get started.'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => profileNotifier.loadUserProfile(),
                child: const Text('Load Profile'),
              ),
            ],
          ),
        ),
        ProfileLoading() => const Center(child: CircularProgressIndicator()),
        ProfileSuccess(:final user) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xffE9EAF0), width: 1),
                  ),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/avatar.svg',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF191F33),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.email,
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF767E94),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
        ProfileError(:final errorMessage) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Error: $errorMessage',
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => profileNotifier.loadUserProfile(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      },
    );
  }
}
