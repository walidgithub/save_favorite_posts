import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';

import '../../../../domain/reposnses/search_results_response.dart';
import '../../../ui_components/buttons/custom_icon_button.dart';


class SearchResultCard extends StatelessWidget {
  final String searchResultResponse;
  final VoidCallback removeCallback;
  const SearchResultCard(
      {super.key, required this.searchResultResponse, required this.removeCallback});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children: [
            SizedBox(width: 20.w),
            CustomIconButton(
              icon: AssetsManager.deleteImg,
              onTap: removeCallback,
            ),
          ],
        ),
        child: SearchResultCard(
          searchResultResponse: searchResultResponse,
        )
    );
  }
}
