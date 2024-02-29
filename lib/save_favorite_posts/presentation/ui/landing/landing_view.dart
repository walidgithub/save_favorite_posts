import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/posts_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';
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
  List searchFilter = [];
  bool editPost = false;
  List<PostsResponse> postData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: selectedPage(context,_currentIndex),
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.kSecondary,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              postData = [];
              searchFilter = [];
              editPost = false;
              _currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsManager.homeSearch, width: 30.w),
              label: AppStrings.home,
              activeIcon: SvgPicture.asset(AssetsManager.homeSearchSelected,
                  width: 30.w),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsManager.addNew),
              label: AppStrings.addNew,
              activeIcon:
                  SvgPicture.asset(AssetsManager.addNewSelected, width: 30.w),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedPage(BuildContext context, int index) {
    if (index == 0) {
      return SearchView(goToEdit: (List lastSearchFilter, List<PostsResponse> gotPostData) {
        setState(() {
          editPost = true;
          searchFilter = lastSearchFilter;
          postData = gotPostData;
          _currentIndex = 1;
        });
      });
    } else if(index == 1) {
      return AddNewPostView(goToSearch: () {
        setState(() {
          _currentIndex = 0;
        });
      }, searchFilter: searchFilter,postData: postData,editPost: editPost,);
    }
    return Container();
  }
}

