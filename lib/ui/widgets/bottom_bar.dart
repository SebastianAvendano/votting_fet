import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:votting/data/models/bottom_bar_model.dart';

class BottomNavigation extends StatelessWidget {
  final List<BottomBarModel> pages;
  final int currentPage;
  final void Function(int)? onChangeTab;

  const BottomNavigation({
    Key? key,
    required this.pages,
    required this.currentPage,
    required this.onChangeTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _buildBottomBarIOS(context);
      default:
        return _buildBottomBarAndroid(context);
    }
  }

  Widget _buildBottomBarAndroid(BuildContext context) {
    return NavigationBar(
      destinations: List.generate(
        pages.length,
        (int index) {
          return NavigationDestination(
            icon: Icon(pages[index].icon),
            label: pages[index].label,
          );
        },
      ),
      selectedIndex: currentPage,
      onDestinationSelected: onChangeTab,
    );
  }

  Widget _buildBottomBarIOS(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: currentPage,
      onTap: onChangeTab,
      items: List.generate(
        pages.length,
        (int index) {
          return BottomNavigationBarItem(
            icon: Icon(pages[index].icon),
            label: pages[index].label,
          );
        },
      ),
    );
  }
}
