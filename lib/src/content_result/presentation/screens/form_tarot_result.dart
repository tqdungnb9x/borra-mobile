import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/widgets/app_button.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../common/widgets/app_image.dart';
import '../../data/models/content_detail_model.dart';
import '../widgets/w_content_info.dart';

class FormTarotResult extends StatefulWidget {
  const FormTarotResult(
      {super.key,
      required this.listTarots,
      required this.contentResult,
      this.onScrollCallback});
  final ContentResult contentResult;
  final List<Map<String, dynamic>> listTarots;
  final VoidCallback? onScrollCallback;
  @override
  State<FormTarotResult> createState() => _FormTarotResultState();
}

class _FormTarotResultState extends State<FormTarotResult>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  late List<Widget> _pages;
  int _selectedIndex = 0;
  late List<Map<String, dynamic>> tarots;
  late ContentResult result;
  @override
  void initState() {
    _tabController =
        TabController(length: widget.listTarots.length, vsync: this);
    tarots = widget.listTarots;
    result = widget.contentResult;
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
    _pages = widget.listTarots
        .map(
          (e) => Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppSize.paddingWithScreen),
            decoration: AppStyles.containerDecoration,
            child: AppImage(
              imageUrl: e['tarot_card'],
            ),
          ),
        )
        .toList();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (_selectedIndex < _pages.length - 1) {
      _selectedIndex += 1;
      _pageController.animateToPage(_selectedIndex,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
      widget.onScrollCallback!.call();
    }
  }

  void prevPage() {
    if (_selectedIndex > 0) {
      _selectedIndex -= 1;
      _pageController.animateToPage(_selectedIndex,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
      widget.onScrollCallback!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    var resultChildren = result.children.sorted((a, b) {
      if (a.parentId == b.parentId) {
        return a.order - b.order;
      } else {
        return a.parentId - b.parentId;
      }
    });
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary01,
          onTap: (value) {
            _selectedIndex = value;
            _pageController.animateToPage(_selectedIndex,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
          },
          tabs: widget.listTarots.map(
            (e) {
              int index = e['tarot_card_order'] + 1;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20.r),
                child: Text(
                  'Card $index',
                  style: AppStyles.text15.preMed,
                ),
              );
            },
          ).toList(),
        ),
        AppSize.space15.verticalSpace,
        tarots.length == 1
            ? Padding(
                padding: EdgeInsets.all(AppSize.paddingWithScreen),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(AppSize.paddingWithScreen),
                      decoration: AppStyles.containerDecoration,
                      child: AppImage(
                        imageUrl:
                            AppImages.getTarotResult(result.purchase.value!),
                      ),
                    ),
                    AppSize.space15.verticalSpace,
                    Container(
                      width: double.infinity,
                      decoration: AppStyles.containerDecoration,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var child = resultChildren[index];
                            var childrenData = result.childrenData
                                .where((element) => element.childId == child.id)
                                .toList();
                            return WContentTarotInfo(
                              signUrl: AppImages.getIconSign(child.sign ?? ''),
                              contentTitle: child.name ?? '',
                              children: childrenData,
                              purchase: result.purchase,
                            );
                          },
                          separatorBuilder: (_, __) => Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSize.paddingWithScreen),
                                child: Divider(
                                  height: 2.r,
                                  color: AppColors.black.withOpacity(0.3),
                                ),
                              ),
                          itemCount: result.children.length),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Container(
                    height: 700.h,
                    padding: EdgeInsets.all(AppSize.paddingWithScreen),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView(
                          controller: _pageController,
                          clipBehavior: Clip.none,
                          children: _pages,
                          onPageChanged: (value) {
                            _selectedIndex = value;
                            _tabController.index = value;
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => prevPage(),
                                child: SvgPicture.asset(
                                  AppImages.icPrev,
                                  width: 64.r,
                                  colorFilter: _selectedIndex == 0
                                      ? ColorFilter.mode(
                                          AppColors.primary01.withOpacity(0.3),
                                          BlendMode.srcIn)
                                      : ColorFilter.mode(
                                          AppColors.primary01, BlendMode.srcIn),
                                ),
                              ),
                              InkWell(
                                onTap: () => nextPage(),
                                child: SvgPicture.asset(
                                  AppImages.icNext,
                                  width: 64.r,
                                  colorFilter: _selectedIndex ==
                                          _pages.length - 1
                                      ? ColorFilter.mode(
                                          AppColors.primary01.withOpacity(0.3),
                                          BlendMode.srcIn)
                                      : ColorFilter.mode(
                                          AppColors.primary01, BlendMode.srcIn),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  AppSize.spaceBetweenWidgetMedium.verticalSpace,
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _pages.length,
                    effect: WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      dotColor: AppColors.black.withOpacity(0.06),
                      activeDotColor: AppColors.primary01,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppSize.paddingWithScreen),
                    child: Container(
                      width: double.infinity,
                      decoration: AppStyles.containerDecoration,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var child =
                                tarots[_selectedIndex]['children'][index];

                            var childrenData = result.childrenData
                                .where((element) => element.childId == child.id)
                                .toList();
                            return WContentTarotInfo(
                              signUrl: AppImages.getIconSign(child.sign),
                              contentTitle: child.name,
                              children: childrenData,
                              purchase: result.purchase,
                            );
                          },
                          separatorBuilder: (_, __) => Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSize.paddingWithScreen),
                                child: Divider(
                                  height: 2.r,
                                  color: AppColors.black.withOpacity(0.3),
                                ),
                              ),
                          itemCount: tarots[_selectedIndex]['children'].length),
                    ),
                  ),
                  AppSize.space15.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.paddingWithScreen),
                    child: Row(
                      children: [
                        Expanded(
                            child: AppButton(
                                text: LocaleKeys.button_previous_card.tr(),
                                type: ButtonType.outline,
                                textStyle: AppStyles.text18.preMed
                                    .copyWith(color: AppColors.black),
                                colorBorder: AppColors.black.withOpacity(0.08),
                                onClicked: () => prevPage())),
                        AppSize.spaceBetweenWidgetMedium.horizontalSpace,
                        Expanded(
                          child: AppButton(
                              text: LocaleKeys.button_next_card.tr(),
                              type: ButtonType.outline,
                              textStyle: AppStyles.text18.preMed
                                  .copyWith(color: AppColors.black),
                              colorBorder: AppColors.black.withOpacity(0.08),
                              onClicked: () => nextPage()),
                        )
                      ],
                    ),
                  ),
                  AppSize.space32.verticalSpace,
                ],
              )
      ],
    );
  }
}
