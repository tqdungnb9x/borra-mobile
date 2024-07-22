import 'package:another_flushbar/flushbar.dart';
import 'package:borra_app/app_base/extensions/extension.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/common/widgets/dialogs/w_question_dialog.dart';
import 'package:borra_app/src/content_detail/business_logic/content_detail/content_detail_bloc.dart';
import 'package:borra_app/src/content_detail/data/models/content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app_base/config/app_config.dart';
import '../../data/services/timer_service.dart';

class WContentButtomButtons extends StatefulWidget {
  const WContentButtomButtons({
    super.key,
    required this.onSubmitClicked,
    required this.content,
  });
  final AppContent content;
  final VoidCallback onSubmitClicked;
  @override
  State<WContentButtomButtons> createState() => _WContentButtomButtonsState();
}

class _WContentButtomButtonsState extends State<WContentButtomButtons> {
  final ResetTimer _resetTimer = ResetTimer.instance;
  int remainTime = 0;
  bool _isLoading = false;
  @override
  void initState() {
    if (widget.content.userWaitFreeTime != null) {
      _resetTimer.counter =
          UtilTimeZone.convertToSecond(widget.content.userWaitFreeTime!);
      _resetTimer.start();
      remainTime = _resetTimer.eslapseTime;
    }
    super.initState();
  }

  @override
  void dispose() {
    _resetTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = 52.r;
    return BlocBuilder<ContentDetailBloc, ContentDetailState>(
      builder: (context, state) {
        return Row(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                var bloc = context.read<ContentDetailBloc>();
                bloc.clickLikeButton(context);
              },
              child: BlocBuilder<ContentDetailBloc, ContentDetailState>(
                builder: (context, state) {
                  return Container(
                    width: buttonHeight,
                    height: buttonHeight,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.spaceBetweenWidgetMedium,
                        vertical: AppSize.spaceBetweenWidgetMedium),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.08),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: state.isLiked
                        ? SvgPicture.asset(AppImages.icLike)
                        : SvgPicture.asset(AppImages.icLikeNoFill),
                  );
                },
              ),
            ),
            AppSize.spaceBetweenWidgetExtraSmall.horizontalSpace,
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: state.isValidInput
                    ? () async {
                        if (widget.content.price == 0 ||
                            (remainTime == 0 &&
                                widget.content.waitFreeTime > 0) ||
                            (widget.content.isFirstFree > 0 &&
                                widget.content.isFirstFreeUsed)) {
                          if (!_isLoading) {
                            _isLoading = true;
                            widget.onSubmitClicked.call();
                            _isLoading = false;
                          }
                        } else if (widget.content.price > 0) {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return ConfirmPayContent(
                                title:
                                    '보유 코인: ${MainBloc.authBloc.state.user!.coin.borraCoin}개',
                                content: Padding(
                                  padding:
                                      EdgeInsets.all(AppSize.paddingWithScreen),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              AppImages.icCurrency),
                                          Text(
                                            ' ${widget.content.isDiscount ? widget.content.discountPrice.toDouble().borraCoin : widget.content.price.toDouble().borraCoin}',
                                            style: AppStyles.text16.preMed
                                                .copyWith(
                                                    color:
                                                        AppColors.timerColor),
                                          ),
                                          Text(
                                            '을 사용해서',
                                            textAlign: TextAlign.center,
                                            style: AppStyles.text14.preLight
                                                .copyWith(
                                                    color: AppColors.neutral03),
                                          )
                                        ],
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text: widget.content.name,
                                          style: AppStyles.text15.preBold
                                              .copyWith(
                                                  color: AppColors.neutral03),
                                          children: [
                                            TextSpan(
                                                text: ' 을(를) 보시겠습니까?',
                                                style: AppStyles.text15.preMed
                                                    .copyWith(
                                                        color: AppColors
                                                            .neutral03))
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                                onConfirmClicked: () {
                                  if (!_isLoading) {
                                    _isLoading = true;
                                    widget.onSubmitClicked.call();
                                    _isLoading = false;
                                  }
                                  return;
                                },
                                onCancelClicked: () {
                                  return;
                                },
                              );
                            },
                          );
                        } else {
                          if (!_isLoading) {
                            _isLoading = true;
                            widget.onSubmitClicked.call();
                            _isLoading = false;
                          }
                        }
                      }
                    : null,
                child: Container(
                    width: double.infinity,
                    height: buttonHeight,
                    // alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.spaceBetweenWidgetMedium),
                    decoration: ShapeDecoration(
                      color: state.isValidInput
                          ? AppColors.primary01
                          : AppColors.buttonDisable,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.radius6),
                      ),
                    ),
                    child: SizedBox(
                        // height: buttonHeight,
                        child: _buildSubmitButton(widget.content))),
              ),
            )
            // Expanded(
          ],
        );
      },
    );
  }

  Widget _buildSubmitButton(AppContent content) {
    if (content.isFirstFree > 0 &&
        widget.content.isFirstFreeUsed &&
        content.waitFreeTime == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.icDiscountCate,
                              height: 16.r,
                              width: 16.r,
                            ),
                            AppSize.spaceSmall.horizontalSpace,
                            Text(
                              content.price.toDouble().borraCoin,
                              style: TextStyle(
                                  color: AppColors.priceDiscountTextColor,
                                  fontSize: 16.r),
                            ),
                          ],
                        ),
                        Container(
                          height: 1.r,
                          width: 40.r,
                          color: AppColors.priceDiscountTextColorLine,
                        )
                      ],
                    ),
                    AppSize.spaceSmall.horizontalSpace,
                    SvgPicture.asset(
                      AppImages.icCurrency,
                      height: 16.r,
                      width: 16.r,
                    ),
                    AppSize.spaceSmall.horizontalSpace,
                    Text(
                      // StringUtils.formatNumber(likeContent.price.toDouble()),
                      content.discountPrice.toDouble().borraCoin,
                      style: TextStyle(
                          color: AppColors.priceTextColor, fontSize: 16.r),
                    )
                  ],
                ),
                // Container(
                //   height: 1.5,
                //   width: content.price > 9999 ? 50.r : 35.r,
                //   color: AppColors.neutral01,
                // )
              ],
            ),
          ),
          AppSize.space32.horizontalSpace,
          Text(
            '지금 바로 무료로 보기',
            style: AppStyles.text15.preMed.copyWith(color: AppColors.white),
          ),
        ],
      );
    }
    if (content.userWaitFreeTime != null && content.waitFreeTime != 0) {
      if (content.userWaitFreeTime != '00:00:00' && !content.isFirstFreeUsed) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.icWaitingTime),
                    AppSize.spaceBetweenWidgetSmall.horizontalSpace,
                    _resetTimer.showTimer(context: context),
                  ],
                ),
                Text('기다리면 무료',
                    style: AppStyles.text13.preMed
                        .copyWith(color: AppColors.white))
              ],
            ),
            Text(
              '결과 확인하기',
              style: AppStyles.text15.preMed.copyWith(color: AppColors.white),
            ),
          ],
        );
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.icWaitingTime),
          AppSize.spaceBetweenWidgetSmall.horizontalSpace,
          _resetTimer.showTimer(context: context),
          AppSize.space32.horizontalSpace,
          Text(
            '지금 바로 무료로 보기',
            style: AppStyles.text15.preMed.copyWith(color: AppColors.white),
          ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (content.price != 0) ...[
          content.isDiscount
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.icDiscountCate,
                              height: 16.r,
                              width: 16.r,
                            ),
                            AppSize.spaceSmall.horizontalSpace,
                            Text(
                              content.price.toDouble().borraCoin,
                              style: TextStyle(
                                  color: AppColors.priceDiscountTextColor,
                                  fontSize: 16.r),
                            ),
                          ],
                        ),
                        Container(
                          height: 1.r,
                          width: 40.r,
                          color: AppColors.priceDiscountTextColorLine,
                        )
                      ],
                    ),
                    AppSize.spaceSmall.horizontalSpace,
                    SvgPicture.asset(
                      AppImages.icCurrency,
                      height: 16.r,
                      width: 16.r,
                    ),
                    AppSize.spaceSmall.horizontalSpace,
                    Text(
                      // StringUtils.formatNumber(likeContent.price.toDouble()),
                      content.discountPrice.toDouble().borraCoin,
                      style: TextStyle(
                          color: AppColors.priceTextColor, fontSize: 16.r),
                    )
                  ],
                )
              : Row(
                  children: [
                    SvgPicture.asset(AppImages.icCurrency),
                    Text(
                      ' ${content.price.toDouble().borraCoin}',
                      style: TextStyle(
                          color: AppColors.priceTextColor, fontSize: 16.r),
                    ),
                  ],
                ),
          AppSize.spaceBetweenWidgetMedium.horizontalSpace,
        ],
        Text(
          // '결과 확인하기',
          LocaleKeys.content_detail_saju_button_text.tr(),
          style: AppStyles.text15.preMed.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
