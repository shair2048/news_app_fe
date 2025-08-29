import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SearchAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://res.cloudinary.com/dkn3kk3un/image/upload/f_auto,q_auto/c_fill,g_auto,h_600,w_800/v1/news_images/y1m0d3bwivmof8vcr9ch?_a=BAMClqZW0',
          ),
          radius: 20,
        ),
      ),

      title: SizedBox(
        height: 48,
        width: double.infinity,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search news...',
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              color: Color(0xFF767E94),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(13),
              child: SvgPicture.asset(
                "assets/icons/search_active.svg",
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(
                  Color(0xFF0864ED),
                  BlendMode.srcIn,
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(color: Color(0xffDADDE5), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(color: Color(0xffDADDE5), width: 1),
            ),

            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 16,
            ),
          ),
        ),
      ),
    );
  }
}
