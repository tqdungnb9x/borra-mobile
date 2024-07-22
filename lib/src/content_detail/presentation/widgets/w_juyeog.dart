import 'dart:async';
import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../common/widgets/dialogs/w_app_dialog.dart';

class WJuyeogSelect extends StatefulWidget {
  const WJuyeogSelect({
    super.key,
    required this.onSelectCard,
  });
  final ValueChanged<List<int>> onSelectCard;
  @override
  State<WJuyeogSelect> createState() => _WJuyeogSelectState();
}

class _WJuyeogSelectState extends State<WJuyeogSelect> {
  late List<int> _items;
  late List<GlobalKey<FlipCardState>> cardKeys;
  late List<int> selectedItems;
  String cardFirst = '';
  String cardSecond = '';

  @override
  void initState() {
    super.initState();
    _generateItems();
    selectedItems = [];
  }

  void _generateItems() {
    final random = Random();
    cardKeys = [];
    _items = List.generate(8, (index) {
      cardKeys.add(GlobalKey<FlipCardState>());
      return random.nextInt(8);
    });
  }

  void _handleItemTap(int index) {
    selectedItems.add(index);
    if (selectedItems.length == 1) {
      cardFirst = AppImages.imgJuyeog.replaceAll(RegExp(r'index'), '$index');
    } else {
      cardSecond = AppImages.imgJuyeog.replaceAll(RegExp(r'index'), '$index');
    }
  }

  Widget _buildSelectedCards(String cardImage) {
    return Image.asset(
      cardImage.isEmpty ? AppImages.imgJuyeogBack : cardImage,
      height: 105.r,
      width: 105.r,
    );
  }

  Widget _buildFoutuneString() {
    return Container(
      width: 245.r,
      padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 32.r),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        '당신의 운세가 어떨지 정성스러운 마음으로 점괘를 선택해주세요.',
        style: AppStyles.text13.preLight,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSelectedCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 9.r),
          decoration: BoxDecoration(
              color: selectedItems.isEmpty ? const Color(0x997D7E7E) : null,
              border: Border.all(color: AppColors.black.withOpacity(0.07)),
              borderRadius: BorderRadius.circular(6.r)),
          child: Text(
            '외괘',
            style: AppStyles.text13.preMed.copyWith(
                color:
                    selectedItems.isEmpty ? AppColors.white : AppColors.black),
          ),
        ),
        AppSize.spaceBetweenWidgetExtraMedium.horizontalSpace,
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 9.r),
          decoration: BoxDecoration(
              color: selectedItems.isEmpty ? null : const Color(0x997D7E7E),
              border: Border.all(color: AppColors.black.withOpacity(0.07)),
              borderRadius: BorderRadius.circular(6.r)),
          child: Text(
            '내괘',
            style: AppStyles.text13.preMed.copyWith(
                color:
                    selectedItems.isEmpty ? AppColors.black : AppColors.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSelectedCards(cardFirst),
            AppSize.space32.horizontalSpace,
            _buildSelectedCards(cardSecond),
          ],
        ),
        AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
        Container(
          color: const Color(0x1EB2B2B2),
          width: double.infinity,
          padding: EdgeInsets.all(AppSize.paddingWithScreen),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFoutuneString(),
              AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
              _buildSelectedCard(),
              AppSize.spaceBetweenWidgetExtraMedium.verticalSpace,
              AnimationLimiter(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  mainAxisSpacing: 10.r,
                  crossAxisSpacing: 10.r,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    _items.length,
                    (index) {
                      return AnimationConfiguration.staggeredGrid(
                        columnCount: 4,
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: ScaleAnimation(
                          scale: 0.5,
                          child: FadeInAnimation(
                            child: InkWell(
                              onTap: () {
                                // widget.onSelectCard(selectedItems);
                                if (selectedItems.length == 2) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return WAppDialog(
                                            content: '로그인이 필요합니다.',
                                            onActionProceed: () {});
                                      });
                                  return;
                                }

                                cardKeys[index].currentState!.toggleCard();
                              },
                              child: FlipCard(
                                key: cardKeys[index],
                                flipOnTouch: false,
                                onFlipDone: (isFront) {
                                  if (!isFront) {
                                    Timer.periodic(const Duration(milliseconds: 500),
                                        (timer) {
                                      cardKeys[index]
                                          .currentState!
                                          .toggleCard();
                                      timer.cancel();
                                    });
                                  }
                                  if (isFront) {
                                    _handleItemTap(_items[index]);
                                    setState(() => _generateItems());
                                  }
                                  widget.onSelectCard(selectedItems);
                                },
                                back: Image.asset(
                                  AppImages.imgJuyeogBack,
                                  height: 60.r,
                                  width: 60.r,
                                ),
                                front: Image.asset(
                                  AppImages.imgJuyeog.replaceAll(
                                      RegExp(r'index'), '${_items[index]}'),
                                  height: 60.r,
                                  width: 60.r,
                                ),
                                side: CardSide.BACK,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
