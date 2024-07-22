import 'package:borra_app/app_base/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Todo: Implement widget for show dialog confirm
class WAppDialog extends Dialog {
  final String content;
  final VoidCallback? onActionProceed;
  final String? title;
  final String? actionString;

  WAppDialog({
    Key? key,
    required this.content,
    this.onActionProceed,
    this.title,
    this.actionString,
  }) : super(
            key: key,
            child: Builder(
              builder: (context) => Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null) ...[
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppStyles.text16,
                      ),
                      SizedBox(height: AppSize.spaceBetweenWidgetExtraSmall),
                    ] else ...[
                      SizedBox(height: AppSize.spaceBetweenWidgetExtraLarge)
                    ],
                    Text(
                      content,
                      textAlign: TextAlign.center,
                      style: AppStyles.text16,
                    ),
                    const Divider(),
                    InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).pop();
                          onActionProceed?.call();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.r),
                          width: double.infinity,
                          child: Text(
                            actionString ?? "닫기",
                            style: AppStyles.text16.preSemiBold
                                .copyWith(color: AppColors.primary01),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.largeRadius),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 10.r));
}
