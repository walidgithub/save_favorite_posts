import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sharing_intent/flutter_sharing_intent.dart';
import 'package:flutter_sharing_intent/model/sharing_file.dart';
import 'package:flutter_svg/svg.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/posts_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import '../../ui_components/buttons/custom_icon_button.dart';
import '../add_new_post/add_new_post_view.dart';
import '../onboarding/components/drawer_info_page.dart';
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
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late StreamSubscription _intentDataStreamSubscription;

  List<SharedFile>? list;

  String externalPostLinkValue = '';

  @override
  void initState() {
    super.initState();
    // For sharing images coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = FlutterSharingIntent.instance
        .getMediaStream()
        .listen((List<SharedFile> value) {
      setState(() {
        list = value;
      });
    }, onError: (err) {});

    // For sharing images coming from outside the app while the app is closed
    FlutterSharingIntent.instance
        .getInitialSharing()
        .then((List<SharedFile> value) {
      setState(() {
        list = value;
      });
    });
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    externalPostLinkValue = '${list?.join("\n\n")}';
    return Scaffold(
      extendBody: true,
      key: scaffoldKey,
      drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: const DrawerInfo()),
      body: Stack(
        children: [
          selectedPage(context,_currentIndex),
          Positioned(
            top: 70.h,
            left: MediaQuery.of(context).size.width - 70.w,
            child: CustomIconButton(
            onTap: () async {
              await Future.delayed(
                  const Duration(milliseconds: 700));
              scaffoldKey.currentState?.openDrawer();
            },
            icon: AssetsManager.drawer,
            borderCol: ColorManager.kLine,
          ),)
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 100.h,
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
              icon: SvgPicture.asset(AssetsManager.addNew, width: 25.w),
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
      }, externalPostLinkValue: externalPostLinkValue, goToAddExternal: () {
          setState(() {
            _currentIndex = 1;
          });
      },);
    } else if(index == 1) {
      return AddNewPostView(goToSearch: () {
        setState(() {
          _currentIndex = 0;
        });
      }, searchFilter: searchFilter,postData: postData,editPost: editPost, externalPostLinkValue: externalPostLinkValue);
    }
    return Container();
  }
}

