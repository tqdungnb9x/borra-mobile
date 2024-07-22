import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app_base/config/app_config.dart';

class WShareDialog extends Dialog {
  final String? title;
  final String content;
  final double? heightDialog;
  final VoidCallback? onKakaoClicked;
  final VoidCallback? onShareLinkClicked;
  WShareDialog(
      {Key? key,
      this.title,
      required this.content,
      this.onShareLinkClicked,
      this.onKakaoClicked,
      this.heightDialog})
      : super(
            key: key,
            child: Builder(
              builder: (context) => Padding(
                padding: EdgeInsets.only(top: 20.w, bottom: AppSize.space50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null) ...[
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppStyles.text16.preBold,
                      ),
                      SizedBox(height: AppSize.spaceBetweenWidgetExtraSmall),
                    ],
                    Text(
                      content,
                      textAlign: TextAlign.center,
                      style: AppStyles.text24.preBold,
                    ),
                    AppSize.space32.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: onKakaoClicked,
                          child: Image.asset(
                            AppImages.igmKakaoShare,
                            height: 60.h,
                            width: 60.h,
                          ),
                        ),
                        AppSize.space32.horizontalSpace,
                        InkWell(
                          onTap: onShareLinkClicked,
                          child: SvgPicture.asset(
                            AppImages.icShareLink,
                            height: 60.h,
                            width: 60.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.maxRadius),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 10.r));
}
