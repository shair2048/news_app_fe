import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app_fe/core/widgets/common_app_bar.dart';
import '../../viewmodel/profile_viewmodel.dart';
import '../widgets/profile_item.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);
    final profileViewmodel = ref.read(profileProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(appBarTitle: 'Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
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
                  // Avatar
                  SvgPicture.asset(
                    'assets/icons/avatar.svg',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  // Name
                  Text(
                    profileState.user.name,
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF191F33),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Email
                  Text(
                    profileState.user.email,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF767E94),
                    ),
                  ),
                ],
              ),
            ),

            // const SizedBox(height: 24),
            Column(
              children:
                  profileViewmodel
                      .getMenuItems(context)
                      .map((menuItem) => ProfileItem(menuItem: menuItem))
                      .toList(),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
