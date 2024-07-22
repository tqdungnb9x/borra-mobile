import 'dart:async';

import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/app_image.dart';
import 'package:borra_app/common/widgets/refresh_load_more_data.dart';
import 'package:borra_app/src/home/business_logic/tag_content/tag_content_bloc.dart';
import 'package:borra_app/src/home/data/models/tag.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../like/presentation/widgets/w_main_content.dart';

class TagAllContentScreenArguments {
  final AppTag? tag;
  final List<AppTag>? listTags;
  final bool? isBottomTab;
  final int? categoryId;
  final String? priceType;
  TagAllContentScreenArguments({
    this.categoryId,
    this.tag,
    this.isBottomTab,
    this.listTags,
    this.priceType,
  });
}

class TagAllContentScreen extends StatefulWidget {
  const TagAllContentScreen({super.key, required this.input});
  final TagAllContentScreenArguments input;
  @override
  State<TagAllContentScreen> createState() => _TagAllContentScreenState();
}

class _TagAllContentScreenState
    extends PageStateful<TagAllContentScreen, TagContentBloc> {
  Completer? completerLoad;
  int selectedIndex = 0;
  bool enabledLoadMore = false;

  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    selectedIndex = widget.input.listTags != null
        ? widget.input.listTags!.indexOf(widget.input.tag!)
        : 0;
    bloc.initial(
        widget.input.tag?.id, widget.input.priceType, widget.input.categoryId);
  }

  String mapBannerWithTagId(int id) {
    switch (id) {
      case 1:
      case 4:
      case 8:
        return 'https://borra.today/assets/tags/ad_banner_1.jpg';
      case 2:
      case 6:
      case 9:
      case 11:
        return 'https://borra.today/assets/tags/ad_banner_2.jpg';
      case 3:
      case 5:
      case 7:
      case 10:
        return 'https://borra.today/assets/tags/ad_banner_3.jpg';
      default:
        return '';
    }
  }

  @override
  Widget buildPage(BuildContext context, TagContentBloc bloc) {
    List<AppTag>? listTags = widget.input.listTags;
    int? tagId = widget.input.tag?.id;
    String? priceType = widget.input.priceType;
    int? categoryId = widget.input.categoryId;
    bool isBottomTab = widget.input.isBottomTab ?? false;
    final double bannerHeight = 202.h;
    return BlocListener<TagContentBloc, TagContentState>(
      listener: (context, state) {
        state.status.whenOrNull(
          idle: () {
            showLoading(context, false);
          },
          loading: () {
            showLoading(context, true);
          },
          success: (data) {
            showLoading(context, false);
            if (data is bool) {
              enabledLoadMore = data;
            }
          },
          failure: (error) async {
            showLoading(context, false);
          },
        );
      },
      listenWhen: ((previous, current) => previous.status != current.status),
      child: BlocListener<TagContentBloc, TagContentState>(
        listener: (context, state) {
          state.loadStatus.whenOrNull(
            idle: () {
              completerLoad = null;
            },
            success: (data) {
              if (completerLoad?.isCompleted == false) {
                completerLoad?.complete();
              }
              setState(() {
                if (data is bool) {
                  enabledLoadMore = data;
                }
              });
            },
            failure: (error) => completerLoad?.complete(),
          );
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: isBottomTab
              ? null
              : AppHeader(
                  context,
                  titleText: LocaleKeys.home_tag_title_title.tr(),
                ),
          body: BlocBuilder<TagContentBloc, TagContentState>(
            buildWhen: (previous, current) =>
                previous.listTagAllContent != current.listTagAllContent,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSize.spaceBetweenWidgetMedium.verticalSpace,
                  BlocBuilder<TagContentBloc, TagContentState>(
                    buildWhen: (previous, current) =>
                        previous.tagId != current.tagId ||
                        previous.listTag != current.listTag,
                    builder: (context, state) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: AppSize.paddingWithScreen,
                            right: AppSize.paddingWithScreen),
                        child: WTagTabList(
                          listTags: listTags ?? state.listTag ?? [],
                          initialIndex: selectedIndex,
                          onSelect: (AppTag value) {
                            selectedIndex = (listTags ?? state.listTag ?? [])
                                .indexOf(value);
                            tagId = value.id;
                            bloc.add(
                                SelectTag(value.id, categoryId, priceType));
                          },
                        ),
                      );
                    },
                  ),
                  isBottomTab
                      ? const SizedBox()
                      : SizedBox(
                          height: bannerHeight,
                          width: double.infinity,
                          child: AppImage(
                            imageUrl: mapBannerWithTagId(state.tagId),
                          ),
                        ),
                  AppSize.paddingWithScreen.verticalSpace,
                  Expanded(
                    child: RefreshLoadMoreDataWidget(
                      onRefresh: () async =>
                          bloc.initial(tagId ?? 0, priceType, categoryId),
                      onLoadMore: () async => enabledLoadMore
                          ? bloc.loadMore(tagId ?? 0, priceType, categoryId)
                          : null,
                      child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSize.paddingWithScreen),
                          itemBuilder: (context, index) {
                            return WMainContent(
                                isBottomTab: isBottomTab,
                                likeContent: state.listTagAllContent[index]);
                          },
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              child: const Divider(
                                thickness: 1,
                              ),
                            );
                          },
                          itemCount: state.listTagAllContent.length),
                    ),
                  ),
                  AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WTagTabList extends StatefulWidget {
  WTagTabList({
    super.key,
    required this.listTags,
    required this.onSelect,
    // required this.scrollController,
    required this.initialIndex,
  });

  final List<AppTag> listTags;
  final Function(AppTag) onSelect;
  int initialIndex = 0;
  @override
  State<WTagTabList> createState() => _WTagTabListtate();
}

class _WTagTabListtate extends State<WTagTabList> {
  /// Controller to scroll or jump to a particular item.
  final ItemScrollController itemScrollController = ItemScrollController();

  /// Controller to scroll a certain number of pixels relative to the current
  /// scroll offset.
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();

  double alignment = 0;
  bool reversed = false;

  @override
  void initState() {
    super.initState();
  }

  void scrollTo(int index) => itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
        alignment: alignment,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53.r,
      child: ScrollConfiguration(
        behavior: _Behavior(),
        child: ScrollablePositionedList.separated(
          // physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.listTags.length,
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          scrollOffsetController: scrollOffsetController,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  widget.initialIndex = index;
                  widget.onSelect(widget.listTags[index]);
                });
                itemScrollController.scrollTo(
                  index: index,
                  // index: index > 2 ? index - 2 : 0,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOutCubic,
                  alignment: 0,
                );
              },
              child: Container(
                height: 53.r,
                padding: EdgeInsets.only(top: 14.r),
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  border: Border(
                    bottom: BorderSide(
                        color: widget.initialIndex == index
                            ? AppColors.primary01
                            : Colors.transparent,
                        width: 2),
                  ),
                ),
                child: Text(
                  widget.listTags[index].name,
                  style: AppStyles.text16,
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => AppSize.space34.horizontalSpace,
        ),
      ),
      // child: ListView.separated(
      //   // shrinkWrap: true,
      //   scrollDirection: Axis.horizontal,
      //   clipBehavior: Clip.none,
      //   itemBuilder: (context, index) {
      //     return InkWell(
      //       onTap: () {
      //         setState(() {
      //           widget.initialIndex = index;
      //           widget.onSelect(widget.listTags[index]);
      //         });
      //       },
      //       child: Container(
      //         height: 53.r,
      //         padding: EdgeInsets.only(top: 14.r),
      //         decoration: BoxDecoration(
      //           border: Border(
      //             bottom: BorderSide(
      //                 color: widget.initialIndex == index
      //                     ? AppColors.primary01
      //                     : Colors.transparent,
      //                 width: 2),
      //           ),
      //         ),
      //         child: Text(
      //           widget.listTags[index].name,
      //           style: AppStyles.text16,
      //         ),
      //       ),
      //     );
      //   },
      //   separatorBuilder: (_, __) => AppSize.space34.horizontalSpace,
      //   itemCount: widget.listTags.length,
      // ),
    );
  }
}

class _Behavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}
