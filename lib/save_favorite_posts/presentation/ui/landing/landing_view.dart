import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import '../add_new_post/add_new_post_view.dart';
import '../search/search_view.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _SearchViewState();
}

class _SearchViewState extends State<LandingView> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const SearchView(),
    const AddNewPostView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 65.h,
        child: BottomNavigationBar(
          // unselectedLabelStyle: const TextStyle(color: ColorManager.kSecondary),
          selectedItemColor: ColorManager.kSecondary,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsManager.home),
              label: 'Home',
              activeIcon: SvgPicture.asset(AssetsManager.homeSelected),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsManager.addNew),
              label: 'Add New',
              activeIcon: SvgPicture.asset(AssetsManager.addNewSelected),
            ),
          ],
        ),
      ),
    );
  }
}
