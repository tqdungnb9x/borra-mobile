import 'dart:async';

import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/widgets/app_image.dart';
import 'package:borra_app/src/content_detail/data/models/tarot.dart';
import 'package:borra_app/src/content_detail/presentation/widgets/w_overlapped_carousel.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'card_tarot.dart';

class WTarotSelect extends StatefulWidget {
  const WTarotSelect({
    super.key,
    required this.onSelectCard,
    required this.listTarot,
  });

  final ValueChanged<List<String>> onSelectCard;
  final List<ContentTarot> listTarot;

  @override
  State<WTarotSelect> createState() => _WTarotSelectState();
}

class _WTarotSelectState extends State<WTarotSelect>
    with TickerProviderStateMixin {
  late List<String> _items;
  List<GlobalKey<FlipCardState>> cardKeys = [];
  late List<String> selectedItems;
  late String guildlineString;
  late AnimationController animationController;
  late AnimationController scrollController;
  late Animation<Offset> animation;
  late Animation<Offset> defaultAnimation;
  late Animation<double> scrollAnimation;
  double scale = 1.0;
  double offset = 0.0;
  double selectedIndex = -1;
  bool stopFlip = false;
  final double defaultCardHeight = 140.r;
  bool isIgnored = false;

  @override
  void initState() {
    super.initState();
    selectedIndex = (22 ~/ 2).toDouble();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scrollController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -0.3),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
    defaultAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
    scrollAnimation = Tween<double>(
      begin: selectedIndex,
      end: selectedIndex,
    ).animate(CurvedAnimation(
      parent: scrollController,
      curve: Curves.easeOut,
    ));

    selectedItems = [];
    List<String> originalList = _generateOriginalList();
    List<String> randomList = _getRandomUniqueSublist(originalList, 22);
    _items = randomList;
    if (widget.listTarot.first.name == 'null') {
      guildlineString = '타로 카드를 선택해 주세요.';
    } else {
      guildlineString = widget.listTarot.first.name;
    }

    scrollController.addListener(() {
      if (scrollController.isAnimating) {
        setState(() {
          selectedIndex = scrollAnimation.value;
        });
      } else if (scrollController.isCompleted) {
        setState(() {
          selectedIndex = scrollAnimation.value.ceilToDouble();
        });
        scrollController.reset();
        animationController.forward();
        cardKeys[selectedIndex.toInt()].currentState!.toggleCard();
      }
    });

    animationController.addListener(() async {
      if (animationController.isCompleted) {
        isIgnored = false;
        await Future.delayed(const Duration(milliseconds: 1000));
        await _handleItemTap(selectedIndex.toInt());
        if (stopFlip == false) {
          animationController.reset();
          selectedIndex = (_items.length ~/ 2).toDouble();
        }
      }
    });
  }

  List<String> _generateOriginalList() {
    List<String> originalList = [];

    for (int i = 1; i <= 22; i++) {
      cardKeys.add(GlobalKey<FlipCardState>());
      originalList.add('${i}s');
      originalList.add('${i}r');
    }

    return originalList;
  }

  List<String> _getRandomUniqueSublist(List<String> originalList, int length) {
    List<String> randomList = List<String>.from(originalList);
    randomList.shuffle();
    return randomList.toSet().take(length).toList();
  }

  FutureOr<void> _handleItemTap(int index) async {
    selectedItems.add(_items[index]);
    widget.onSelectCard(selectedItems);
    if (selectedItems.length < widget.listTarot.length) {
      guildlineString = widget.listTarot[selectedItems.length].name;
      await cardKeys[index].currentState!.toggleCard();
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        _items.removeAt(index);
      });
    } else if (selectedItems.length == widget.listTarot.length) {
      isIgnored = true;
      stopFlip = true;
      setState(() {
        guildlineString = '카드를 모두 선택 하셨습니다.\n결과를 확인해 주세요.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double wWidth = MediaQuery.of(context).size.width;
    return Container(
      height: DeviceUtils.getDeviceType(context) == 'phone'
          ? wWidth * 350 / 338
          : 400.h,
      width: wWidth,
      padding: EdgeInsets.symmetric(vertical: AppSize.paddingWithScreen),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.tarotWidgetBg,
        border: Border.all(
          color: AppColors.black.withOpacity(0.08),
        ),
        borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withOpacity(0.05),
            offset: const Offset(0, 9),
            blurRadius: 19,
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.space36),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 10.h, horizontal: AppSize.space22),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF001AF6)),
                    borderRadius: BorderRadius.circular(AppSize.mediumRadius)),
                child: Text(
                  guildlineString,
                  style: AppStyles.text15.preLight
                      .copyWith(color: const Color(0xFF001AF6)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Expanded(flex: 1, child: Container()),
          Expanded(
            flex: DeviceUtils.getDeviceType(context) == 'phone' ? 2 : 3,
            child: AbsorbPointer(
              absorbing: isIgnored,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        var index = selectedIndex - details.delta.dx * 0.02;
                        setState(() {
                          if (index < 0) {
                            selectedIndex = 0;
                          } else if (index > _items.length - 1) {
                            selectedIndex = _items.length - 1;
                          } else {
                            selectedIndex = index;
                          }
                        });
                      });
                    },
                    onPanEnd: (details) {
                      setState(() {
                        selectedIndex = selectedIndex.ceil().toDouble();
                      });
                    },
                    child: OverlappedCarouselCardItems(
                      maxWidth: constraints.maxWidth,
                      maxHeight: wWidth  * 140.8 / 338,
                      cards: List.generate(_items.length, (index) {
                        var tarot = _items[index];
                        return CardModel(
                            id: index,
                            child: SlideTransition(
                              position: index == selectedIndex
                                  ? animation
                                  : defaultAnimation,
                              child: FlipCard(
                                key: cardKeys[index],
                                flipOnTouch: false,
                                back: AppImage(
                                  imageUrl:
                                      '${AppConfig.instance.env.siteUrl}assets/contents/tarot/back.png',
                                  fit: BoxFit.fill,
                                ),
                                front: tarot.contains('r')
                                    ? Transform.flip(
                                        flipY: true,
                                        child: AppImage(
                                          imageUrl:
                                              '${AppConfig.instance.env.siteUrl}assets/contents/tarot/${tarot.substring(0, tarot.length - 1)}.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : AppImage(
                                        imageUrl:
                                            '${AppConfig.instance.env.siteUrl}assets/contents/tarot/${tarot.substring(0, tarot.length - 1)}.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                side: CardSide.BACK,
                              ),
                            ));
                      }),
                      centerIndex: selectedIndex,
                      onClicked: (index) {
                        setState(() {
                          isIgnored = true;
                        });
                        scrollAnimation = Tween<double>(
                          begin: selectedIndex,
                          end: index.toDouble(),
                        ).animate(CurvedAnimation(
                          parent: scrollController,
                          curve: Curves.linear,
                        ));
                        scrollController.forward().then((value) {});
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
