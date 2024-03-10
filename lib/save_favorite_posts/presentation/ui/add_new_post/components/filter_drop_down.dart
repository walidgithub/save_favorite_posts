import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/filter_response.dart';

import '../../../../shared/constant/app_typography.dart';
import '../../../../shared/constant/constant_values_manager.dart';
import '../../../../shared/style/colors_manager.dart';

class FilterDropDown extends StatefulWidget {
  TextEditingController filterEditingController = TextEditingController();
  FilterResponse selectedFilter;
  List<FilterResponse> filterResponse;
  String hintText;
  Function onChanged;
  FilterDropDown(
      {required this.filterEditingController,
      required this.selectedFilter,
      required this.filterResponse,
      required this.hintText,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  State<FilterDropDown> createState() => _FilterDropDownState();
}

class _FilterDropDownState extends State<FilterDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: DropdownButton2(
          underline: Container(),
          value: widget.selectedFilter,
          items: widget.filterResponse.map((item) {
            return DropdownMenuItem(
                value: item,
                child: Row(
                  children: [
                    Container(
                        constraints: BoxConstraints(maxWidth: 200.w),
                        child: Text(item.title!, style: AppTypography.kExtraLight15.copyWith(color: ColorManager.kSecondary))),
                  ],
                ));
          }).toList(),
          onChanged: (selectedFilter) {
            widget.onChanged(selectedFilter);
          },
          dropdownSearchData: DropdownSearchData(
            searchController: widget.filterEditingController,
            searchInnerWidgetHeight: 60,
            searchInnerWidget: Container(
              height: 60,
              padding: const EdgeInsets.only(top: 8, bottom: 4, right: 8, left: 8),
              child: TextField(
                expands: true,
                maxLines: null,
                controller: widget.filterEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: widget.hintText,
                  hintStyle: AppTypography.kExtraLight14,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radius),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              widget.selectedFilter = item.value as FilterResponse;
              var choose = widget.selectedFilter.title!.toLowerCase();
              return choose.contains(searchValue.toLowerCase());
            },
          ),
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              widget.filterEditingController.clear();
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
            maxHeight: 300.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius),
              color: ColorManager.kBackground,
              border: Border.all(
                color: ColorManager.kLine
              )
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
              Text(widget.hintText, style: AppTypography.kExtraLight14),
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
