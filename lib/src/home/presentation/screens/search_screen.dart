import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/models/status.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/src/home/business_logic/blocs/home_bloc.dart';
import 'package:borra_app/src/home/presentation/widgets/w_section_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../like/presentation/widgets/w_main_content.dart';
import '../widgets/w_tarot_today.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends PageStateful<SearchScreen, HomeBloc> {
  TextEditingController search = TextEditingController();
  final double _searchColorOpacity = 0.5;
  final double _horizontalKeywordTileGap = 0.5;

  @override
  void afterFirstBuild(BuildContext context) {
    bloc.initialSearch();
    super.afterFirstBuild(context);
  }

  @override
  Widget buildPage(BuildContext context, HomeBloc bloc) {
    return Container(
      color: AppColors.white,
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
                child: TextFormField(
                  controller: search,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      bloc.add(const ClearSearch());
                    }
                  },
                  onTap: () {
                    bloc.add(const SearchShowing(true));
                  },
                  decoration: InputDecoration(
                      hintText: LocaleKeys.home_search_search_hint.tr(),
                      hintStyle: AppStyles.text16
                          .copyWith(color: AppColors.black.withOpacity(0.5)),
                      filled: true,
                      suffixIconConstraints: BoxConstraints(maxHeight: 18.h),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(
                          right: AppSize.paddingWithScreen,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            bloc.add(const SearchShowing(false));
                            bloc.add(ExecuteSearch(search.text));
                          },
                          child: SvgPicture.asset(
                            AppImages.icSearch,
                          ),
                        ),
                      ),
                      fillColor: AppColors.black.withOpacity(0.04),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.black.withOpacity(0.08),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.black.withOpacity(0.08),
                            width: 0.5),
                        borderRadius:
                            BorderRadius.circular(AppSize.mediumRadius),
                      ),
                      contentPadding:
                          EdgeInsets.all(AppSize.paddingWithScreen)),
                ),
              ),
              AppSize.space15.verticalSpace,
              Expanded(
                child: Stack(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                      return BlocListener<HomeBloc, HomeState>(
                        listener: (context, state) {
                          state.statusLoadSearch.whenOrNull(
                            idle: () {
                              showLoading(context, false);
                            },
                            loading: () {
                              showLoading(context, true);
                            },
                            success: (data) {
                              showLoading(context, false);
                              // enabledLoadMore = data;
                            },
                            failure: (error) async {
                              showLoading(context, false);
                            },
                          );
                        },
                        listenWhen: ((previous, current) =>
                            previous.statusLoadSearch !=
                            current.statusLoadSearch),
                        child: BlocBuilder<HomeBloc, HomeState>(
                          buildWhen: (previous, current) =>
                              previous.listSearchResult !=
                              current.listSearchResult,
                          builder: (context, state) {
                            if (state.listSearchResult == null) {
                              return BlocBuilder<HomeBloc, HomeState>(
                                buildWhen: (previous, current) =>
                                    previous.listKeywords !=
                                    current.listKeywords,
                                builder: (context, state) {
                                  if (state.listKeywords == null) {
                                    return Container();
                                  }
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSize.paddingWithScreen),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: AppSize.paddingWithScreen,
                                          ),
                                          child: WSectionHeader(
                                            headerTitle: LocaleKeys
                                                .home_search_suggested_header
                                                .tr(),
                                          ),
                                        ),
                                        Container(
                                          height: 35.h,
                                          alignment: Alignment.topLeft,
                                          child: ListView.separated(
                                            clipBehavior: Clip.none,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  search.text = state
                                                      .listKeywords![index];
                                                  bloc.add(ExecuteSearch(state
                                                      .listKeywords![index]));
                                                  setState(() {});
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(AppSize
                                                        .spaceBetweenWidgetExtraSmall),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: AppColors
                                                                .black
                                                                .withOpacity(
                                                                    0.2)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r)),
                                                    child: Text(state
                                                        .listKeywords![index])),
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return 8.h.horizontalSpace;
                                            },
                                            itemCount:
                                                state.listKeywords!.length,
                                          ),
                                        ),
                                        AppSize.space15.verticalSpace,
                                        BlocBuilder<HomeBloc, HomeState>(
                                          buildWhen: (previous, current) =>
                                              previous.listRecommend !=
                                              current.listRecommend,
                                          builder: (context, state) {
                                            if (state.listRecommend == null) {
                                              return Container();
                                            }
                                            return Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: AppSize
                                                        .paddingWithScreen,
                                                  ),
                                                  child: WSectionHeader(
                                                    headerTitle: LocaleKeys
                                                        .home_search_recommend_header
                                                        .tr(),
                                                  ),
                                                ),
                                                Container(
                                                  height: AppSize
                                                      .horizontalListHeight,
                                                  alignment: Alignment.topLeft,
                                                  child: ListView.separated(
                                                    clipBehavior: Clip.none,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return WContentWithLike(
                                                        tarotToday: state
                                                                .listRecommend![
                                                            index],
                                                        isLiked: state
                                                            .listLikedIds
                                                            .contains(state
                                                                .listRecommend![
                                                                    0]
                                                                .id),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return 10
                                                          .h
                                                          .horizontalSpace;
                                                    },
                                                    itemCount: state
                                                        .listRecommend!.length,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                            if (state.listSearchResult != null &&
                                state.listSearchResult!.isNotEmpty) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSize.paddingWithScreen),
                                height: double.infinity,
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return WMainContent(
                                          likeContent:
                                              state.listSearchResult![index]);
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
                                    itemCount: state.listSearchResult!.length),
                              );
                            }
                            if (state.listSearchResult!.isEmpty) {
                              return Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  LocaleKeys.home_search_search_empty.tr(),
                                  style: AppStyles.text15,
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      );
                    }),
                    BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) =>
                          previous.searchingHistoryList !=
                              current.searchingHistoryList ||
                          previous.isSearchShowing != current.isSearchShowing,
                      builder: (context, state) {
                        if (state.isSearchShowing) {
                          return Positioned.fill(
                              child: GestureDetector(
                            onTap: () {
                              bloc.add(const SearchShowing(false));
                            },
                            child: Container(
                              color: AppColors.black
                                  .withOpacity(_searchColorOpacity),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: AppSize.spaceBetweenWidgetSmall,
                                  ),
                                  Container(
                                    color: AppColors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSize.paddingWithScreen,
                                        vertical: AppSize.paddingWithScreen),
                                    child: state.status ==
                                            const Status.loading()
                                        ? const SizedBox(
                                            width: double.infinity,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()))
                                        : Column(
                                            children: [
                                              _searchingRecommendation(
                                                keyword: LocaleKeys
                                                    .home_search_recommend_keyword
                                                    .tr(),
                                              ),
                                              const Divider(),
                                              _searchingHistory(
                                                  history: state
                                                      .searchingHistoryList)
                                            ],
                                          ),
                                  )
                                ],
                              ),
                            ),
                          ));
                        }

                        return Container();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchingRecommendation({String keyword = ""}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.radius6),
              border: Border.all(
                color: AppColors.neutral09,
              )),
          child: Text(LocaleKeys.home_search_suggestion.tr()),
        ),
        SizedBox(
          width: AppSize.spaceBetweenWidgetSmall,
        ),
        GestureDetector(
            onTap: () {
              search.text = keyword;
              bloc.add(const SearchShowing(false));
              bloc.add(ExecuteSearch(keyword));
            },
            child: Text(keyword))
      ],
    );
  }

  Widget _searchingHistory({required List<String> history}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                search.text = history[index];
                bloc.add(const SearchShowing(false));
                bloc.add(ExecuteSearch(history[index]));
              },
              horizontalTitleGap: _horizontalKeywordTileGap,
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.history,
                color: AppColors.black,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  bloc.add(SearchingHistoryRemove(history[index]));
                },
              ),
              title: Text(
                history[index],
                style: AppStyles.text14.preMed,
              ),
            ),
            const Divider()
          ],
        );
      },
      itemCount: history.length,
    );
  }
}
