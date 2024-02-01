import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/constant/constant_values_manager.dart';
import '../../../../shared/style/colors_manager.dart';
import 'container_component.dart';

class PaginationView extends StatefulWidget {
  int totalPages;
  List<int> middlePages;
  PaginationView({required this.totalPages, required this.middlePages, Key? key}) : super(key: key);

  @override
  State<PaginationView> createState() => _PaginationViewState();
}

class _PaginationViewState extends State<PaginationView> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // decrease current page
        Bounceable(
            duration: Duration(
                milliseconds: AppConstants.durationOfBounceable),
            onTap: () async {
              await Future.delayed(Duration(
                  milliseconds: AppConstants.durationOfBounceable));
              if (currentPage >= 2) {
                setState(() {
                  currentPage--;

                  if (widget.totalPages >= 5) {
                    if (currentPage == widget.middlePages[0] &&
                        (currentPage - 1) != 1 &&
                        widget.totalPages >= 5) {
                      widget.middlePages = [];
                      widget.middlePages = [
                        currentPage - 1,
                        currentPage,
                        currentPage + 1
                      ];
                    }

                    if (currentPage == widget.middlePages[1] &&
                        (currentPage + 2) != widget.totalPages) {
                      widget.middlePages = [];
                      widget.middlePages = [
                        currentPage - 1,
                        currentPage,
                        currentPage + 1
                      ];
                    }

                    if (currentPage == widget.middlePages[2] &&
                        (currentPage + 1) != widget.totalPages) {
                      widget.middlePages = [];
                      widget.middlePages = [
                        currentPage - 1,
                        currentPage,
                        currentPage + 1
                      ];
                    }
                  }
                });
              }
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 25.sp,
              color: currentPage > 1
                  ? ColorManager.kPrimary
                  : ColorManager.kPrimary.withOpacity(0.5),
            )),

        // current page = 1
        Bounceable(
            duration: Duration(
                milliseconds: AppConstants.durationOfBounceable),
            onTap: () async {
              await Future.delayed(Duration(
                  milliseconds: AppConstants.durationOfBounceable));
              setState(() {
                currentPage = 1;

                if (widget.totalPages >= 5) {
                  widget.middlePages = [
                    currentPage + 1,
                    currentPage + 2,
                    currentPage + 3
                  ];
                }
              });
            },
            child: containerComponent(
                context,
                Center(
                  child: Text('1',
                      style: TextStyle(
                          color: currentPage == 1
                              ? ColorManager.kLine
                              : ColorManager.kPrimary,
                          fontSize: 20.sp)),
                ),
                height: 30.h,
                width: 30.w,
                color: currentPage == 1
                    ? ColorManager.kPrimary
                    : ColorManager.kLine,
                borderColor: ColorManager.kLine,
                borderWidth: 0.0.w,
                borderRadius: 5.w)),

        widget.totalPages >= 5
            ? widget.middlePages[0] - 1 > 1
            ? Text(
          ' ..',
          style: TextStyle(
              color: ColorManager.kPrimary, fontSize: 20.sp),
        )
            : Container()
            : Container(),

        currentPage > 1 ? SizedBox(
          width: 1.w,
        ) : Container(),

        // middle current pages
        Row(
          children: [
            SizedBox(
              height: 30.h,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.middlePages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Bounceable(
                          duration: Duration(
                              milliseconds:
                              AppConstants.durationOfBounceable),
                          onTap: () async {
                            await Future.delayed(Duration(
                                milliseconds:
                                AppConstants.durationOfBounceable));
                            setState(() {
                              currentPage = widget.middlePages[index];

                              if (widget.totalPages >= 5) {
                                if (currentPage == widget.middlePages[0] &&
                                    (currentPage - 1) != 1) {
                                  widget.middlePages = [];
                                  widget.middlePages = [
                                    currentPage - 1,
                                    currentPage,
                                    currentPage + 1
                                  ];
                                }

                                if (currentPage == widget.middlePages[1] &&
                                    (currentPage + 2) != widget.totalPages) {
                                  widget.middlePages = [];
                                  widget.middlePages = [
                                    currentPage - 1,
                                    currentPage,
                                    currentPage + 1
                                  ];
                                }

                                if (currentPage == widget.middlePages[2] &&
                                    (currentPage + 1) != widget.totalPages) {
                                  widget.middlePages = [];
                                  widget.middlePages = [
                                    currentPage - 1,
                                    currentPage,
                                    currentPage + 1
                                  ];
                                }
                              }
                            });
                          },
                          child: containerComponent(
                              context,
                              margin: const EdgeInsets.only(left: 2),
                              width: 30.w,
                              Center(
                                  child: Text(
                                      widget.middlePages[index].toString(),
                                      style: TextStyle(
                                          color: currentPage ==
                                              widget.middlePages[index]
                                              ? ColorManager.kLine
                                              : ColorManager.kPrimary,
                                          fontSize: 20.sp))),
                              padding: const EdgeInsets.fromLTRB(
                                  5,
                                  0,
                                  5,
                                  0),
                              color: currentPage == widget.middlePages[index]
                                  ? ColorManager.kPrimary
                                  : ColorManager.kLine,
                              borderColor:
                              currentPage == widget.middlePages[index]
                                  ? ColorManager.kPrimary
                                  : ColorManager.kLine,
                              borderWidth: 0.0.w,
                              borderRadius: 5.w))
                    ],
                  );
                },
              ),
            ),
          ],
        ),

        SizedBox(
          width: AppConstants.smallWidthBetweenElements,
        ),

        widget.totalPages >= 5
            ? widget.middlePages[2] < widget.totalPages - 1
            ? Text(
          '..',
          style: TextStyle(
              color: ColorManager.kPrimary, fontSize: 20.sp),
        )
            : Container()
            : Container(),

        widget.totalPages >= 5
            ? widget.middlePages[2] < widget.totalPages - 1
            ? SizedBox(
          width: AppConstants.smallWidthBetweenElements,
        )
            : Container()
            : Container(),

        // last current page
        widget.totalPages > 1
            ? Row(
          children: [
            Bounceable(
                duration: Duration(
                    milliseconds:
                    AppConstants.durationOfBounceable),
                onTap: () async {
                  await Future.delayed(Duration(
                      milliseconds:
                      AppConstants.durationOfBounceable));
                  setState(() {
                    currentPage = widget.totalPages;

                    if (widget.totalPages >= 5) {
                      widget.middlePages = [
                        currentPage - 3,
                        currentPage - 2,
                        currentPage - 1
                      ];
                    }
                  });
                },
                child: containerComponent(
                    context,
                    Center(
                      child: Text(widget.totalPages.toString(),
                          style: TextStyle(
                              color: currentPage == widget.totalPages
                                  ? ColorManager.kLine
                                  : ColorManager.kWhite,
                              fontSize: 20.sp)),
                    ),
                    height: 30.h,
                    padding: const EdgeInsets.fromLTRB(
                        5,
                        0,
                        5,
                        0),
                    color: widget.totalPages == currentPage
                        ? ColorManager.kPrimary
                        : ColorManager.kLightBrown,
                    borderColor: widget.totalPages == currentPage
                        ? ColorManager.kPrimary
                        : ColorManager.kLightBrown,
                    borderWidth: 0.0.w,
                    borderRadius: 5.w))
          ],
        )
            : Container(),

        widget.totalPages > 1
            ? SizedBox(
          width: AppConstants.smallWidthBetweenElements,
        )
            : Container(),

        // increase current page
        Bounceable(
            duration: Duration(
                milliseconds: AppConstants.durationOfBounceable),
            onTap: () async {
              await Future.delayed(Duration(
                  milliseconds: AppConstants.durationOfBounceable));

              if (currentPage < widget.totalPages) {
                setState(() {
                  currentPage++;
                  if (widget.totalPages >= 5) {
                    if (currentPage == widget.middlePages[0] &&
                        (currentPage - 1) != 1) {
                      widget.middlePages = [];
                      widget.middlePages = [
                        currentPage - 1,
                        currentPage,
                        currentPage + 1
                      ];
                    }

                    if (currentPage == widget.middlePages[1] &&
                        (currentPage + 2) != widget.totalPages) {
                      widget.middlePages = [];
                      widget.middlePages = [
                        currentPage - 1,
                        currentPage,
                        currentPage + 1
                      ];
                    }

                    if (currentPage == widget.middlePages[2] &&
                        (currentPage + 1) != widget.totalPages) {
                      widget.middlePages = [];
                      widget.middlePages = [
                        currentPage - 1,
                        currentPage,
                        currentPage + 1
                      ];
                    }
                  }
                });
              }
            },
            child: Icon(Icons.arrow_forward_ios,
                size: 25.sp,
                color: currentPage == widget.totalPages
                    ? ColorManager.kPrimary.withOpacity(0.5)
                    : ColorManager.kPrimary)),
      ],
    );
  }
}
