import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/dialogs/w_app_dialog.dart';
import 'package:borra_app/src/home_notice/business_logic/notice_bloc.dart';
import 'package:borra_app/src/home_notice/data/models/notice_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../common/widgets/loading/app_loading.dart';

class NoticeDetailScreen extends StatefulWidget {
  const NoticeDetailScreen({super.key, required this.notice});
  final dynamic notice;

  @override
  State<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
  NoticeBloc noticeBloc = NoticeBloc();
  AppNotice? appNotice;
  @override
  void initState() {
    if (widget.notice is int) {
      noticeBloc.getNotice(id: widget.notice).then((value) {
        if (value == null) {
          if (mounted) {
            showDialog(
              context: context,
              builder: (context) {
                return WAppDialog(content: 'Notice not found');
              },
            );
          }
        } else {
          setState(() {
            appNotice = value;
          });
        }
      });
    } else {
      appNotice = widget.notice;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (appNotice == null) {
      return Container(
          color: AppColors.white,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: const AppCircularLoading());
    }
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppHeader(
        context,
        titleText: LocaleKeys.home_common_notice_title.tr(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.paddingWithScreen,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appNotice!.name,
              style: AppStyles.text18.preBold,
            ),
            AppSize.spaceBetweenWidgetSmall.verticalSpace,
            Text(
              appNotice!.createdAt,
              style: AppStyles.text14.preReg
                  .copyWith(color: AppColors.black.withOpacity(0.5)),
            ),
            AppSize.spaceBetweenWidgetMedium.verticalSpace,
            Html(
              data: appNotice!.contents,
              style: {
                "p": AppStyles.htmlStyle,
                "h1": AppStyles.htmlHeadingStyle,
                "h2": AppStyles.htmlMediumStyle,
              },
            )
          ],
        ),
      ),
    );
  }
}
