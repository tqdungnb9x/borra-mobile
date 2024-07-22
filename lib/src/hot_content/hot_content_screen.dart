import 'dart:async';

import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/models/status.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/loading/app_loading.dart';
import 'package:borra_app/common/widgets/refresh_load_more_data.dart';
import 'package:borra_app/src/hot_content/data/models/category.dart';
import 'package:borra_app/src/hot_content/presentation/widget/ad_mob.dart';
import 'package:borra_app/src/like/presentation/widgets/w_main_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'business_logic/category_bloc.dart';

class HotContentScreen extends StatefulWidget {
  const HotContentScreen({super.key});

  @override
  State<HotContentScreen> createState() => _HotContentScreenState();
}

class _HotContentScreenState
    extends PageStateful<HotContentScreen, CategoryBloc> {
  Completer? completerLoad;
  bool enabledLoadMore = false;
  // ContentCategory? category;

  @override
  void afterFirstBuild(BuildContext context) {
    bloc.initialHotContent();
    // category = bloc.state.listCategory?.first;
    // bloc.add(SelectCategory(category!));
    super.afterFirstBuild(context);
  }

  @override
  Widget buildPage(BuildContext context, CategoryBloc bloc) {
    // final double bannerHeight = 202.h;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            24.verticalSpace,
            BlocBuilder<CategoryBloc, CategoryState>(
              buildWhen: (previous, current) =>
                  previous.listCategory != current.listCategory ||
                  previous.selectedCategory != current.selectedCategory,
              builder: (context, state) {
                if (state.listCategory == null) {
                  return const AppCircularLoading();
                }

                return Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSize.paddingWithScreen),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              LocaleKeys.home_hot_content_view_content_by_cat
                                  .tr(),
                              style: AppStyles.text18.preBold,
                            ),
                            AppSize.paddingWithScreen.verticalSpace,
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: AppSize.paddingWithScreen,
                              runSpacing: AppSize.paddingWithScreen,
                              children: state.listCategory!
                                  .map((e) => WCategoryItem(
                                        category: e,
                                        selectedCategory:
                                            state.selectedCategory ??
                                                state.listCategory!.first,
                                        onSelect: (p0) {
                                          bloc.add(SelectCategory(p0));
                                          // setState(() {
                                          //   category = p0;
                                          // });
                                        },
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: BlocListener<CategoryBloc, CategoryState>(
                          listener: (context, state) {
                            state.statusLoadMore.whenOrNull(
                              idle: () {
                                completerLoad = null;
                              },
                              success: (data) {
                                if (completerLoad?.isCompleted == false) {
                                  completerLoad?.complete();
                                }
                                setState(() {
                                  enabledLoadMore = data;
                                });
                              },
                              failure: (error) => completerLoad?.complete(),
                            );
                          },
                          child: BlocBuilder<CategoryBloc, CategoryState>(
                            buildWhen: (previous, current) =>
                                previous.listContentByCat !=
                                    current.listContentByCat ||
                                previous.selectedCategory !=
                                    current.selectedCategory ||
                                previous.statusGetContentByCat !=
                                    current.statusGetContentByCat,
                            builder: (context, state) {
                              if (state.statusGetContentByCat ==
                                  const Status.loading()) {
                                return const AppCircularLoading();
                              }
                              return Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSize.paddingWithScreen),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   state.listCategory != null
                                    //       ? "${state.listCategory!.firstWhere((element) => element.id == bloc.state.selectedCategory?.id).name} ${LocaleKeys.home_categories_collect_content.tr()}"
                                    //       : "",
                                    //   style: AppStyles.text18.preBold,
                                    // ),
                                    AppSize.paddingWithScreen.verticalSpace,
                                    (state.listContentByCat.isEmpty)
                                        ? Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(20.r),
                                                width: double.infinity,
                                                alignment: Alignment.topCenter,
                                                child: Text(LocaleKeys
                                                    .common_no_content
                                                    .tr()),
                                              ),
                                              SizedBox(
                                                height: 10.r,
                                              ),
                                              const CategoryAdmob(
                                                templateType:
                                                    TemplateType.small,
                                                factoryID: "listTile",
                                              )
                                            ],
                                          )
                                        : Expanded(
                                            child: RefreshLoadMoreDataWidget(
                                              onRefresh: () async {
                                                bloc.removeAll();
                                                bloc.selectCategory(bloc.state
                                                        .selectedCategory ??
                                                    bloc.state.listCategory!
                                                        .first);
                                              },
                                              onLoadMore: () async =>
                                                  enabledLoadMore
                                                      ? bloc.loadMore(bloc.state
                                                              .selectedCategory ??
                                                          bloc
                                                              .state
                                                              .listCategory!
                                                              .first)
                                                      : null,
                                              enableLoadmore: enabledLoadMore,
                                              child: ListView.separated(
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        ((index + 1) % 2 == 0)
                                                            ? Column(
                                                                children: [
                                                                  WMainContent(
                                                                      likeContent:
                                                                          state.listContentByCat[
                                                                              index]),
                                                                  const CategoryAdmob(
                                                                    templateType:
                                                                        TemplateType
                                                                            .small,
                                                                    factoryID:
                                                                        "listTile",
                                                                  )
                                                                ],
                                                              )
                                                            : WMainContent(
                                                                likeContent:
                                                                    state.listContentByCat[
                                                                        index]),
                                                        SizedBox(
                                                          height: (index ==
                                                                      state.listContentByCat
                                                                              .length -
                                                                          1 &&
                                                                  state.listContentByCat
                                                                          .length <
                                                                      8)
                                                              ? (50 *
                                                                      (8 -
                                                                          state
                                                                              .listContentByCat
                                                                              .length))
                                                                  .r
                                                              : 0,
                                                        )
                                                      ],
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 14.h),
                                                      child: const Divider(
                                                        thickness: 1,
                                                      ),
                                                    );
                                                  },
                                                  itemCount: state
                                                      .listContentByCat.length),
                                            ),
                                          ),
                                    AppSize.spaceBetweenWidgetExtraLarge
                                        .verticalSpace,
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WCategoryItem extends StatelessWidget {
  const WCategoryItem({
    super.key,
    required this.category,
    required this.onSelect,
    required this.selectedCategory,
  });
  final ContentCategory category;
  final ContentCategory selectedCategory;
  final Function(ContentCategory) onSelect;

  Widget mapIcon() {
    final iconSize = Size(17.r, 17.r);
    switch (category.id) {
      case 1:
        return SvgPicture.asset(
          AppImages.icAll,
          width: iconSize.width,
          height: iconSize.height,
        );
      case 2:
        return SvgPicture.asset(
          AppImages.icTea,
          width: iconSize.width,
          height: iconSize.height,
        );
      case 3:
        return SvgPicture.asset(
          AppImages.icDarkBright,
          width: iconSize.width,
          height: iconSize.height,
        );
      case 4:
        return SvgPicture.asset(
          AppImages.icCard,
          width: iconSize.width,
          height: iconSize.height,
        );
      case 5:
        return SvgPicture.asset(
          AppImages.icMoon,
          width: iconSize.width,
          height: iconSize.height,
        );
      case 6:
        return SvgPicture.asset(
          AppImages.icCalendar,
          width: iconSize.width,
          height: iconSize.height,
        );
      case 8:
        return SvgPicture.asset(
          AppImages.icClock,
          width: iconSize.width,
          height: iconSize.height,
        );
      case 9:
        return SvgPicture.asset(
          AppImages.icNote,
          width: iconSize.width,
          height: iconSize.height,
        );
      default:
        return SvgPicture.asset(
          AppImages.icTel,
          width: iconSize.width,
          height: iconSize.height,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(category),
      child: Container(
        width: 156.w,
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
              color: selectedCategory == category
                  ? const Color.fromRGBO(158, 155, 254, 1)
                  : AppColors.black.withOpacity(.08)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            mapIcon(),
            AppSize.spaceBetweenWidgetExtraSmall.horizontalSpace,
            SizedBox(
              child: Text(
                category.name ?? "",
                style: selectedCategory == category
                    ? AppStyles.text14.preBold.copyWith(
                        color: AppColors.black, letterSpacing: -0.18.r)
                    : AppStyles.text14.preMed.copyWith(
                        color: AppColors.black, letterSpacing: -0.18.r),
              ),
            )
          ],
        ),
      ),
    );
  }
}
