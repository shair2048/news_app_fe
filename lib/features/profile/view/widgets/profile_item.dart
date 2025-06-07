import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app_fe/features/profile/model/profile_model.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class ProfileItem extends ConsumerWidget {
  final ProfileMenuItem menuItem;
  const ProfileItem({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: menuItem.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xffE9EAF0), width: 1),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              menuItem.iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Color(0xFF191F33), BlendMode.srcIn),
            ),
            const SizedBox(width: 16),
            Expanded(child: Text(menuItem.title)),
            if (menuItem.hasSwitch)
              Switch(
                value: menuItem.switchValue ?? false,
                onChanged: menuItem.onSwitchChanged,
              ),
          ],
        ),
      ),
    );
  }
}
