import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/common/widgets/app_button.dart';
import 'package:borra_app/common/widgets/w_app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Todo: Implement widget for show dialog question
class WQuestionDialog extends Dialog {
  final String? title;
  final String content;
  final String? actionString;
  final String? cancelString;
  final double? heightDialog;
  final VoidCallback? onCancelClicked;
  final void Function() onConfirmClicked;
  WQuestionDialog(
      {Key? key,
      this.title,
      this.actionString,
      this.cancelString,
      required this.content,
      required this.onConfirmClicked,
      this.onCancelClicked,
      this.heightDialog})
      : super(
            key: key,
            child: Builder(
              builder: (context) => Padding(
                padding: EdgeInsets.only(top: 20.w),
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
                      style: AppStyles.text16,
                    ),
                    SizedBox(height: AppSize.spaceBetweenWidgetExtraMedium),
                    const AppDivider(
                      height: 0.5,
                      color: AppColors.dividerColor,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: AppButton(
                            text: cancelString ?? "취소",
                            textStyle: AppStyles.text16.preReg,
                            type: ButtonType.none,
                            onClicked: () {
                              Navigator.of(context).pop();
                              onCancelClicked?.call();
                            },
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 52.r,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.dividerColor)),
                        ),
                        Flexible(
                          child: AppButton(
                            text: actionString ?? "저장",
                            type: ButtonType.none,
                            textStyle: AppStyles.text16.preBold
                                .copyWith(color: AppColors.primary01),
                            onClicked: () {
                              Navigator.of(context).pop();
                              onConfirmClicked.call();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.largeRadius),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 10.r));
}

class ConfirmPayContent extends Dialog {
  final String? title;
  final Widget? content;
  final String? stringContent;
  final String? actionString;
  final String? cancelString;
  final double? heightDialog;
  final VoidCallback? onCancelClicked;
  final void Function() onConfirmClicked;
  ConfirmPayContent(
      {Key? key,
      this.title,
      this.actionString,
      this.cancelString,
      required this.content,
      this.stringContent,
      required this.onConfirmClicked,
      this.onCancelClicked,
      this.heightDialog})
      : super(
            key: key,
            child: Builder(
              builder: (context) => Padding(
                padding: EdgeInsets.only(top: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null) ...[
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppStyles.text20.preBold,
                      ),
                      SizedBox(height: AppSize.spaceBetweenWidgetExtraSmall),
                    ],
                    content ??
                        Text(
                          stringContent ?? '',
                          textAlign: TextAlign.center,
                          style: AppStyles.text16,
                        ),
                    SizedBox(height: AppSize.spaceBetweenWidgetExtraMedium),
                    const AppDivider(
                      height: 0.5,
                      color: AppColors.dividerColor,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: AppButton(
                            text: cancelString ?? "아니요",
                            textStyle: AppStyles.text16.preReg,
                            type: ButtonType.none,
                            onClicked: () {
                              Navigator.of(context).pop();
                              onCancelClicked?.call();
                            },
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 52.r,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.dividerColor)),
                        ),
                        Flexible(
                          child: AppButton(
                            text: actionString ?? "예",
                            type: ButtonType.none,
                            textStyle: AppStyles.text16.preBold
                                .copyWith(color: AppColors.primary01),
                            onClicked: () {
                              Navigator.of(context).pop();
                              onConfirmClicked.call();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.largeRadius),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 10.r));
}
