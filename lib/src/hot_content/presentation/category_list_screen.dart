import 'dart:async';
import 'dart:math';

import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/refresh_load_more_data.dart';
import 'package:borra_app/src/hot_content/business_logic/category_bloc.dart';
import 'package:borra_app/src/hot_content/data/models/category.dart';
import 'package:borra_app/src/hot_content/presentation/widget/ad_mob.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../app_base/constants/ad_unit_id.dart';
import '../../../app_base/models/ad_unit_id_model.dart';
import '../../../common/admob/native_ad.dart';
import '../../like/presentation/widgets/w_main_content.dart';

class CategoryListContentScreen extends StatefulWidget {
  const CategoryListContentScreen({super.key, required this.category});
  final ContentCategory category;
  @override
  State<CategoryListContentScreen> createState() =>
      _CategoryListContentScreenState();
}

class _CategoryListContentScreenState
    extends PageStateful<CategoryListContentScreen, CategoryBloc> {
  Completer? completerLoad;
  bool enabledLoadMore = false;
  bool adLoadFail = false;

  void handleAdLoadedFail() {
    setState(() {
      adLoadFail = true;
    });
  }

  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    bloc.initial();
    bloc.add(SelectCategory(widget.category));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context, CategoryBloc bloc) {
    return BlocListener<CategoryBloc, CategoryState>(
        listener: (context, state) {
          state.status.whenOrNull(
            idle: () {
              showLoading(context, false);
            },
            loading: () {
              showLoading(context, false);
            },
            success: (data) {
              showLoading(context, false);
              enabledLoadMore = data;
            },
            failure: (error) async {
              showLoading(context, false);
            },
          );
        },
        listenWhen: ((previous, current) => previous.status != current.status),
        child: BlocListener<CategoryBloc, CategoryState>(
          listener: (context, state) {
            state.statusGetContentByCat.whenOrNull(
              idle: () {
                showLoading(context, false);
              },
              loading: () {
                showLoading(context, false);
              },
              success: (data) {
                showLoading(context, false);
                enabledLoadMore = data;
              },
              failure: (error) async {
                showLoading(context, false);
              },
            );
          },
          listenWhen: ((previous, current) =>
              previous.statusGetContentByCat != current.statusGetContentByCat),
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
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppHeader(
                context,
                titleText: LocaleKeys.home_categories_content_title.tr(),
              ),
              body: BlocBuilder<CategoryBloc, CategoryState>(
                buildWhen: (previous, current) =>
                    previous.listContentByCat != current.listContentByCat,
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.paddingWithScreen,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.listCategory != null
                              ? "${state.listCategory!.firstWhere((element) => element.id == widget.category.id).name} ${LocaleKeys.home_categories_collect_content.tr()}"
                              : "",
                          style: AppStyles.text18.preBold,
                        ),
                        AppSize.paddingWithScreen.verticalSpace,
                        (state.listContentByCat.isEmpty)
                            ? Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20.r),
                                    width: double.infinity,
                                    alignment: Alignment.topCenter,
                                    child:
                                        Text(LocaleKeys.common_no_content.tr()),
                                  ),
                                  SizedBox(
                                    height: 10.r,
                                  ),
                                  const CategoryAdmob(
                                    templateType: TemplateType.small,
                                    factoryID: "listTile",
                                  )
                                ],
                              )
                            : Expanded(
                                child: RefreshLoadMoreDataWidget(
                                  onRefresh: () async {
                                    bloc.removeAll();
                                    bloc.selectCategory(widget.category);
                                  },
                                  onLoadMore: () async => enabledLoadMore
                                      ? bloc.loadMore(widget.category)
                                      : null,
                                  enableLoadmore: enabledLoadMore,
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            ((index + 1) % 2 == 0)
                                                ? Column(
                                                    children: [
                                                      WMainContent(
                                                          likeContent: state
                                                                  .listContentByCat[
                                                              index]),
                                                      const CategoryAdmob(
                                                        templateType:
                                                            TemplateType.small,
                                                        factoryID: "listTile",
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
                                      separatorBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 14.h),
                                          child: const Divider(
                                            thickness: 1,
                                          ),
                                        );
                                      },
                                      itemCount: state.listContentByCat.length),
                                ),
                              ),
                        AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
