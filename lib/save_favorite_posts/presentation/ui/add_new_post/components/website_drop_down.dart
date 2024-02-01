import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/reposnses/website_response.dart';
import '../../../../shared/constant/app_typography.dart';
import '../../../../shared/constant/constant_values_manager.dart';
import '../../../../shared/constant/strings_manager.dart';
import '../../../../shared/style/colors_manager.dart';

class WebsiteDropDown extends StatefulWidget {
  TextEditingController websiteEditingController = TextEditingController();
  WebsiteResponse? selectedWebSite;
  List<WebsiteResponse> websiteResponse;
  WebsiteDropDown(
      {required this.websiteEditingController,
      required this.selectedWebSite,
      required this.websiteResponse,
      Key? key})
      : super(key: key);

  @override
  State<WebsiteDropDown> createState() => _WebsiteDropDownState();
}

class _WebsiteDropDownState extends State<WebsiteDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: DropdownButton2(
          underline: Container(),
          value: widget.selectedWebSite,
          items: widget.websiteResponse.map((item) {
            return DropdownMenuItem(
                value: item.title,
                child: Row(
                  children: [
                    Container(
                        constraints: BoxConstraints(maxWidth: 60.w),
                        child: Text(item.title, style: AppTypography.kBold16)),
                  ],
                ));
          }).toList(),
          onChanged: (selectedCustomer) {
            setState(() {
              // widget.selectedWebSite = selectedCustomer as widget.websiteResponse?;
              // widget.selectedWebSiteName =
              // '${selectedCustomer?.firstName} ${selectedCustomer?.lastName}';
              // widget.selectedWebSiteId = selectedCustomer?.id;
              // widget.selectedWebSiteTel = selectedCustomer?.mobile;
              // _selectedPriceGroupId = selectedCustomer?.priceGroupsId ?? 0;
            });
          },
          dropdownSearchData: DropdownSearchData(
            searchController: widget.websiteEditingController,
            searchInnerWidgetHeight: 60,
            searchInnerWidget: Container(
              height: 60,
              padding: const EdgeInsets.only(top: 8, bottom: 4, right: 8, left: 8),
              child: TextField(
                expands: true,
                maxLines: null,
                controller: widget.websiteEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: AppStrings.website,
                  hintStyle: AppTypography.kExtraLight14,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radius),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              widget.selectedWebSite = item.value as WebsiteResponse?;
              var choose = widget.selectedWebSite!.title;
              return choose.contains(searchValue);
            },
          ),
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              widget.websiteEditingController.clear();
            }
          },
          buttonStyleData: ButtonStyleData(
            height: 60.h,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius),
              border: Border.all(
                color: ColorManager.kLine,
              ),
              color: ColorManager.kBackground,
            ),
            elevation: 0,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 400.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius),
              color: ColorManager.kBackground,
            ),
            elevation: 0,
            offset: const Offset(0, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: Radius.circular(AppConstants.radius),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          isExpanded: true,
          hint: Row(
            children: [
              Text(AppStrings.website, style: AppTypography.kExtraLight14),
              SizedBox(
                width: AppConstants.smallWidthBetweenElements,
              )
            ],
          ),
          style: AppTypography.kExtraLight14,
        )),
      ],
    );
  }
}
