import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? appBarTitle;
  const CommonAppBar({super.key, this.appBarTitle});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(
        appBarTitle ?? '',
        style: const TextStyle(
          color: Color(0xff191F33),
          fontSize: 16,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/arrow_left.svg',
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
        onPressed: () {
          // Navigator.pop(context);
        },
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.5),
        child: Container(color: Colors.grey, height: 0.5),
      ),
    );
  }
}
