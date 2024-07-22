import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';

class WAppPaging extends StatefulWidget {
  const WAppPaging({
    super.key,
    required this.pageCount,
    required this.onSelectPage,
  });
  final int pageCount;
  final ValueChanged<int> onSelectPage;
  @override
  State<WAppPaging> createState() => _WAppPagingState();
}

class _WAppPagingState extends State<WAppPaging> {
  late int selectedPage;
  late List<int> listPage;
  @override
  void initState() {
    selectedPage = 0;
    listPage = List<int>.generate(widget.pageCount, (index) => index + 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25.h,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                if (selectedPage > 0) {
                  selectedPage--;
                }
                setState(() {});
                widget.onSelectPage(listPage[selectedPage]);
              },
              child: Container(
                width: 25.r,
                height: 25.r,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFAAB7CE),
                    ),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 10.r,
                  color: const Color(0xFFAAB7CE),
                ),
              ),
            ),
            2.horizontalSpace,
            ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      selectedPage = index;
                    });
                    widget.onSelectPage(listPage[selectedPage]);
                  },
                  child: Container(
                    width: 25.r,
                    height: 25.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: selectedPage == index
                                ? AppColors.primary01
                                : const Color(0xFFAAB7CE)),
                        shape: BoxShape.circle),
                    child: Text(
                      listPage[index].toString(),
                      style: AppStyles.text12.preReg.copyWith(
                          color: selectedPage == index
                              ? AppColors.primary01
                              : const Color(0xFFAAB7CE)),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => 2.horizontalSpace,
              itemCount: listPage.length,
            ),
            2.horizontalSpace,
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (selectedPage < listPage.length - 1) {
                  selectedPage++;
                }
                setState(() {});
                widget.onSelectPage(listPage[selectedPage]);
              },
              child: Container(
                width: 25.r,
                height: 25.r,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFAAB7CE),
                    ),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 10.r,
                  color: const Color(0xFFAAB7CE),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
