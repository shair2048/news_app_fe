import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_fe/core/routes/app_router.dart';

class CommonBottomNavBar extends ConsumerWidget {
  const CommonBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    final currentTab = () {
      if (currentLocation.startsWith('/category')) return NavBar.category;
      if (currentLocation.startsWith('/search')) return NavBar.search;
      if (currentLocation.startsWith('/bookmark')) return NavBar.bookmark;
      if (currentLocation.startsWith('/profile')) return NavBar.profile;
      return NavBar.home;
    }();

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: NavBar.values.indexOf(currentTab),
      onTap: (index) {
        final selectedTab = NavBar.values[index];
        final targetRoute = tabRoutes[selectedTab];

        if (currentLocation != targetRoute) {
          context.go(targetRoute!);
        }
      },
      selectedLabelStyle: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      selectedItemColor: Color(0xff191F33),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      unselectedItemColor: Color(0xff767E94),
      backgroundColor: Colors.white,

      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/home.svg'),
          activeIcon: SvgPicture.asset('assets/icons/home_active.svg'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/stack.svg'),
          activeIcon: SvgPicture.asset('assets/icons/stack_active.svg'),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          activeIcon: SvgPicture.asset('assets/icons/search_active.svg'),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/bookmark.svg'),
          activeIcon: SvgPicture.asset('assets/icons/bookmark_active.svg'),
          label: 'Bookmark',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/user_circle.svg'),
          activeIcon: SvgPicture.asset('assets/icons/user_circle_active.svg'),
          label: 'Profile',
        ),
      ],
    );
  }
}
