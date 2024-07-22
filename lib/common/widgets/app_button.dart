import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onClicked;
  final Color? color;
  final Color? colorBorder;
  final TextStyle? textStyle;
  final ButtonType type;
  const AppButton({
    super.key,
    required this.text,
    this.onClicked,
    this.color,
    this.colorBorder,
    this.textStyle,
    this.type = ButtonType.fill,
  });

  @override
  Widget build(BuildContext context) {
    Widget btn() {
      switch (type) {
        case ButtonType.none:
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color ?? AppColors.white,
                borderRadius: BorderRadius.circular(AppSize.mediumRadius),
                border: Border.all(
                    color: colorBorder ?? AppColors.white,
                    width: AppSize.borderWidth)),
            child: Text(
              text,
              style: textStyle ??
                  AppStyles.text16.preSemiBold
                      .copyWith(color: AppColors.neutral01),
            ),
          );

        case ButtonType.disabled:
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: AppSize.spaceBetweenWidgetMedium),
            decoration: BoxDecoration(
                color: color ?? AppColors.borderDisable,
                borderRadius: BorderRadius.circular(AppSize.mediumRadius),
                border: Border.all(
                    color: colorBorder ?? AppColors.borderDisable,
                    width: AppSize.borderWidth)),
            child: Text(
              text,
              style: textStyle ??
                  AppStyles.text18.preSemiBold.copyWith(color: AppColors.white),
            ),
          );
        case ButtonType.fill:
          return Container(
            // width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: AppSize.spaceBetweenWidgetMedium),
            decoration: BoxDecoration(
              // gradient: const LinearGradient(colors: AppColors.buttonDefault),
              color: AppColors.primary01,
              borderRadius: BorderRadius.circular(AppSize.mediumRadius),
            ),
            child: Text(
              text,
              style: textStyle ??
                  AppStyles.text18.preSemiBold.copyWith(color: AppColors.white),
            ),
          );

        case ButtonType.outline:
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: AppSize.spaceBetweenWidgetMedium),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                  width: AppSize.borderWidth,
                  color: colorBorder ?? AppColors.primary01),
              borderRadius: BorderRadius.circular(AppSize.mediumRadius),
            ),
            child: Text(
              text,
              style: textStyle ??
                  AppStyles.text18.preSemiBold
                      .copyWith(color: AppColors.primary01),
            ),
          );
        case ButtonType.kakao:
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: AppSize.spaceBetweenWidgetMedium),
            decoration: ShapeDecoration(
              color: AppColors.kakaoBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.radius6),
              ),
            ),
            child: Text(
              text.isNotEmpty ? text : LocaleKeys.button_kakao.tr(),
              style: textStyle ?? AppStyles.text15.preMed,
            ),
          );
        case ButtonType.submit:
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: AppSize.spaceBetweenWidgetMedium),
            decoration: ShapeDecoration(
              color: AppColors.kakaoBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.radius6),
              ),
            ),
            child: Text(
              text.isNotEmpty ? text : LocaleKeys.button_kakao.tr(),
              style: textStyle ?? AppStyles.text15.preMed,
            ),
          );
      }
    }

    return InkWell(
      onTap: () {
        if (ButtonType.kakao == type) {
          Navigator.pushNamed(context, AppRoutesMain.signIn);
        }
        onClicked?.call();
      },
      child: btn(),
    );
  }
}

enum ButtonType { none, disabled, fill, outline, kakao, submit }
