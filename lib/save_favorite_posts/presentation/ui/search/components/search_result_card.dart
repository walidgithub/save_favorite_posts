import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/search/components/search_card.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import '../../../../domain/reposnses/posts_response.dart';
import '../../../ui_components/buttons/custom_icon_button.dart';


class SearchResultView extends StatelessWidget {
  final PostsResponse postsResponse;
  final int index;
  final Function goToEdit;
  final Function toggleSeen;
  final VoidCallback removeCallback;
  final VoidCallback shareCallback;
  const SearchResultView(
      {super.key, required this.postsResponse, required this.removeCallback, required this.shareCallback, required this.index, required this.goToEdit, required this.toggleSeen});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.4.w,
          motion: const ScrollMotion(),
          children: [
            SizedBox(width: 10.w),
            CustomIconButton(
              icon: AssetsManager.deleteImg,
              onTap: removeCallback,
            ),
            SizedBox(width: 10.w),
            CustomIconButton(
              icon: AssetsManager.shareImg,
              onTap: shareCallback,
            ),
          ],
        ),
        child: SearchCard(
          index: index,
          goToEdit: goToEdit,
          toggleSeen: toggleSeen,
          postsResponse: postsResponse,
        )
    );
  }
}

/*
SearchCard(
          index: index,
          postsResponse: postsResponse,
        )
 */
