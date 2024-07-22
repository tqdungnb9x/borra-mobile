import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/common/widgets/w_media.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AppHeader extends AppBar {
  AppHeader(
    this.context, {
    super.key,
    super.bottom,
    this.showBackground = false,
    this.showAction = true,
    this.showLeading = false,
    this.leadingWidget,
    this.backIcon,
    this.titleText,
    this.actionClicked,
    this.onBackClicked,
    this.onTitleClicked,
    this.bottomWidget,
    this.actionWidgets,
    this.leadingClicked,
  });

  final BuildContext context;
  final bool showBackground;
  final bool showLeading;
  final bool showAction;
  final String? titleText;
  final String? backIcon;
  final Widget? leadingWidget;
  final List<Widget>? actionWidgets;
  final Widget? bottomWidget;
  final VoidCallback? actionClicked;
  final Function()? onBackClicked;
  final Function()? onTitleClicked;
  final VoidCallback? leadingClicked;

  @override
  bool get automaticallyImplyLeading => false;

  @override
  Color get backgroundColor => AppColors.white;

  @override
  Color get shadowColor => Colors.transparent;

  @override
  IconThemeData get iconTheme => const IconThemeData(
        color: AppColors.black, //change your color here
      );

  @override
  Widget? get title => titleText != null
      ? Text(
          titleText ?? '',
          style: AppStyles.text16.preBold.copyWith(color: AppColors.black),
        )
      : InkWell(
          onTap: () => onTitleClicked?.call(),
          child: Image.asset(
            AppImages.imgLogoMain,
            height: 51.h,
            width: 81.w,
            fit: BoxFit.cover,
          ),
        );

  @override
  Widget? get leading => showLeading
      ? leadingWidget ??
          IconButton(
            onPressed: () {
              leadingClicked!.call();
            },
            icon: SvgWidget.asset(
              AppImages.icMenu,
              width: 26.h,
              height: 26.h,
            ),
          )
      : const SizedBox.shrink();

  @override
  bool? get centerTitle => true;

  @override
  List<Widget>? get actions => showAction
      ? actionWidgets ??
          [
            Padding(
              padding: EdgeInsets.only(right: AppSize.paddingWithScreen),
              child: InkWell(
                onTap: actionClicked == null
                    ? () {
                        Navigator.of(context).pop();
                      }
                    : () {
                        actionClicked!.call();
                      },
                child: const Icon(
                  Icons.close,
                  color: AppColors.black,
                ),
              ),
            ),
          ]
      : [];

  @override
  PreferredSizeWidget get bottom => PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: bottomWidget ?? const SizedBox(),
      );
}
