import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/constant/constant_values_manager.dart';
import '../../../../shared/style/colors_manager.dart';
import 'container_component.dart';

class PaginationView extends StatefulWidget {
  int totalPages;
  int currentPage;
  List<int> middlePages;
  Function firstPage;
  Function lastPage;
  Function nextPage;
  Function prevPage;
  Function middlePage;
  PaginationView(
      {required this.totalPages,
        required this.currentPage,
        required this.middlePages,
        required this.firstPage,
        required this.lastPage,
        required this.nextPage,
        required this.prevPage,
        required this.middlePage,
        Key? key})
      : super(key: key);

  @override
  State<PaginationView> createState() => _PaginationViewState();
}

class _PaginationViewState extends State<PaginationView> {
  int currentPage = 1;
  List<int> middlePages = [];

  @override
  void didUpdateWidget(PaginationView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentPage != oldWidget.currentPage) {
      currentPage = widget.currentPage;
    }
    if (widget.middlePages != oldWidget.middlePages) {
      middlePages = widget.middlePages;
    }
  }

  @override
  void initState() {
    middlePages = widget.middlePages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // decrease current page
        Bounceable(
            duration: Duration(milliseconds: AppConstants.durationOfBounceable),
            onTap: () async {
              await Future.delayed(
                  Duration(milliseconds: AppConstants.durationOfBounceable));
              if (currentPage >= 2) {
                currentPage--;

                if (widget.totalPages >= 5) {
                  if (currentPage == middlePages[0] &&
                      (currentPage - 1) != 1 &&
                      widget.totalPages >= 5) {
                    middlePages = [];
                    middlePages = [
                      currentPage - 1,
                      currentPage,
                      currentPage + 1
                    ];
                  }

                  if (currentPage == middlePages[1] &&
                      (currentPage + 2) != widget.totalPages) {
                    middlePages = [];
                    middlePages = [
                      currentPage - 1,
                      currentPage,
                      currentPage + 1
                    ];
                  }

                  if (currentPage == middlePages[2] &&
                      (currentPage + 1) != widget.totalPages) {
                    middlePages = [];
                    middlePages = [
                      currentPage - 1,
                      currentPage,
                      currentPage + 1
                    ];
                  }
                }
              }
              widget.prevPage(currentPage, middlePages);
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
            duration: Duration(milliseconds: AppConstants.durationOfBounceable),
            onTap: () async {
              await Future.delayed(
                  Duration(milliseconds: AppConstants.durationOfBounceable));

              currentPage = 1;

              if (widget.totalPages >= 5) {
                middlePages = [
                  currentPage + 1,
                  currentPage + 2,
                  currentPage + 3
                ];
              }

              widget.firstPage(currentPage, middlePages);
            },
            child: containerComponent(
                context,
                Center(
                  child: Text('1',
                      style: TextStyle(
                          color: currentPage == 1
                              ? ColorManager.kLine
                              : ColorManager.kWhite,
                          fontSize: 20.sp)),
                ),
                height: 30.h,
                width: 32.w,
                color: currentPage == 1
                    ? ColorManager.kPrimary
                    : ColorManager.kOrange,
                borderColor: ColorManager.kLine,
                borderWidth: 0.0.w,
                borderRadius: 5.w)),

        widget.totalPages >= 5
            ? middlePages.isNotEmpty
            ? middlePages[0] - 1 > 1
            ? Text(
          ' ..',
          style: TextStyle(
              color: ColorManager.kPrimary, fontSize: 20.sp),
        )
            : Container()
            : Container()
            : Container(),

        currentPage > 1
            ? SizedBox(
          width: 1.w,
        )
            : Container(),

        // middle current pages
        Row(
          children: [
            SizedBox(
              height: 30.h,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: middlePages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Bounceable(
                          duration: Duration(
                              milliseconds: AppConstants.durationOfBounceable),
                          onTap: () async {
                            await Future.delayed(Duration(
                                milliseconds:
                                AppConstants.durationOfBounceable));

                            currentPage = middlePages[index];
                            if (widget.totalPages >= 5) {
                              if (currentPage == middlePages[0] &&
                                  (currentPage - 1) != 1) {
                                middlePages = [];
                                middlePages = [
                                  currentPage - 1,
                                  currentPage,
                                  currentPage + 1
                                ];
                              }

                              if (currentPage == middlePages[1] &&
                                  (currentPage + 2) != widget.totalPages) {
                                middlePages = [];
                                middlePages = [
                                  currentPage - 1,
                                  currentPage,
                                  currentPage + 1
                                ];
                              }

                              if (currentPage == middlePages[2] &&
                                  (currentPage + 1) != widget.totalPages) {
                                middlePages = [];
                                middlePages = [
                                  currentPage - 1,
                                  currentPage,
                                  currentPage + 1
                                ];
                              }
                            }
                            widget.middlePage(currentPage, middlePages);
                            print(middlePages[index].toString().length);
                          },
                          child: containerComponent(
                              context,
                              margin: const EdgeInsets.only(left: 2),
                              // width: middlePages[index].toString().length > 1 ? 45.w : 30.w,
                              Center(
                                  child: Text(middlePages[index].toString(),
                                      style: TextStyle(
                                          color:
                                          currentPage == middlePages[index]
                                              ? ColorManager.kLine
                                              : ColorManager.kPrimary,
                                          fontSize: 20.sp))),
                              padding: EdgeInsets.fromLTRB(
                                  middlePages[index].bitLength > 1 ? 10.w : 5.w,
                                  0,
                                  middlePages[index].bitLength > 1 ? 10.w : 5.w,
                                  0),
                              color: currentPage == middlePages[index]
                                  ? ColorManager.kPrimary
                                  : ColorManager.kLine,
                              borderColor: currentPage == middlePages[index]
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
            ? middlePages.isNotEmpty
            ? middlePages[2] < widget.totalPages - 1
            ? Text(
          '..',
          style: TextStyle(
              color: ColorManager.kPrimary, fontSize: 20.sp),
        )
            : Container()
            : Container()
            : Container(),

        widget.totalPages >= 5
            ? middlePages.isNotEmpty
            ? middlePages[2] < widget.totalPages - 1
            ? SizedBox(
          width: AppConstants.smallWidthBetweenElements,
        )
            : Container()
            : Container()
            : Container(),

        // last current page
        widget.totalPages > 1
            ? Row(
          children: [
            Bounceable(
                duration: Duration(
                    milliseconds: AppConstants.durationOfBounceable),
                onTap: () async {
                  await Future.delayed(Duration(
                      milliseconds: AppConstants.durationOfBounceable));

                  currentPage = widget.totalPages;

                  if (widget.totalPages >= 5) {
                    middlePages = [
                      currentPage - 3,
                      currentPage - 2,
                      currentPage - 1
                    ];
                  }

                  widget.lastPage(currentPage, middlePages);
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
                    padding: EdgeInsets.fromLTRB(
                        widget.totalPages.bitLength > 1 ? 10 : 5,
                        0,
                        widget.totalPages.bitLength > 1 ? 10 : 5,
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
            duration: Duration(milliseconds: AppConstants.durationOfBounceable),
            onTap: () async {
              await Future.delayed(
                  Duration(milliseconds: AppConstants.durationOfBounceable));

              if (currentPage < widget.totalPages) {
                currentPage++;
                if (widget.totalPages >= 5) {
                  if (currentPage == middlePages[0] && (currentPage - 1) != 1) {
                    middlePages = [];
                    middlePages = [
                      currentPage - 1,
                      currentPage,
                      currentPage + 1
                    ];
                  }

                  if (currentPage == middlePages[1] &&
                      (currentPage + 2) != widget.totalPages) {
                    middlePages = [];
                    middlePages = [
                      currentPage - 1,
                      currentPage,
                      currentPage + 1
                    ];
                  }

                  if (currentPage == middlePages[2] &&
                      (currentPage + 1) != widget.totalPages) {
                    middlePages = [];
                    middlePages = [
                      currentPage - 1,
                      currentPage,
                      currentPage + 1
                    ];
                  }
                }
              }
              widget.prevPage(currentPage, middlePages);
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
