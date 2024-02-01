import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/website_response.dart';

import '../../../shared/style/colors_manager.dart';
import '../../ui_components/texts/heading_rich_text.dart';
import 'components/website_drop_down.dart';

class AddNewPostView extends StatefulWidget {
  const AddNewPostView({Key? key}) : super(key: key);

  @override
  State<AddNewPostView> createState() => _AddNewPostViewState();
}

class _AddNewPostViewState extends State<AddNewPostView> {

  final TextEditingController postLinkController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController _websiteEditingController =
  TextEditingController();

  WebsiteResponse? selectedWebSite;
  String _selectedFirstCategory = '';
  String _selectedSecondCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const HeadingRichText(
                text1: 'You can\n',
                text2: 'Add new post',
              ),
              SizedBox(height: 28.h),
              Expanded(child: _buildBody()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
              autofocus: true,
              readOnly: true,
              keyboardType: TextInputType.text,
              spellCheckConfiguration: const SpellCheckConfiguration(),
              controller: postLinkController,
              decoration: InputDecoration(
                  // hintText: '${list?.join("\n\n")}',
                  hintText: 'link',
                  hintStyle: TextStyle(fontSize: 15.sp),
                  labelText: 'post link',
                  labelStyle: TextStyle(
                      fontSize: 15.sp, color: ColorManager.kPrimary),
                  border: InputBorder.none)),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 50.h,
              child: WebsiteDropDown(websiteEditingController: _websiteEditingController,selectedWebSite: selectedWebSite, websiteResponse: websiteResponse,)),
          SizedBox(
            height: 20.h,
          ),
          // description -------------------------------------------------------------------------
          TextField(
            autofocus: false,
            controller: descriptionController,
            minLines: 3, // Set this
            maxLines: 6, // and this
            spellCheckConfiguration: const SpellCheckConfiguration(),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                labelText: 'Description',
                alignLabelWithHint: true,
                labelStyle: TextStyle(
                    fontSize: 15.sp, color: ColorManager.kPrimary),
                border: InputBorder.none),),
        ],
      ),
          );
  }
}
