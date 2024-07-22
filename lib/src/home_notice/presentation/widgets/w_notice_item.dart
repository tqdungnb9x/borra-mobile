import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/src/home_notice/data/models/notice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';

class WNoticeItem extends StatelessWidget {
  const WNoticeItem({
    super.key,
    required this.notice,
  });
  final AppNotice notice;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.pushNamed(context, AppRoutesMain.noticeContentDetail,
              arguments: notice);
        },
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            notice.name,
            style: AppStyles.text15.preBold,
          ),
          subtitle: Text(
            notice.createdAt,
            style: AppStyles.text12.preLight
                .copyWith(color: AppColors.black.withOpacity(0.5)),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16.r,
            color: AppColors.black,
          ),
        ));
  }
}

class WFaqItem extends StatelessWidget {
  const WFaqItem({
    super.key,
    required this.notice,
  });
  final AppNotice notice;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        iconColor: AppColors.primary01,
        tilePadding: const EdgeInsets.symmetric(horizontal: 0),
        title: Text(
          notice.name,
          style: AppStyles.text15.preBold,
        ),
        children: [
          Html(
            data: notice.contents,
            style: {
              "p": AppStyles.htmlStyle,
              "h1": AppStyles.htmlHeadingStyle,
              "h2": AppStyles.htmlMediumStyle,
            },
          )
        ],
      ),
    );
  }
}
