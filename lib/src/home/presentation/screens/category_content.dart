import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/refresh_load_more_data.dart';
import 'package:borra_app/src/home/business_logic/category_content/category_content_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../like/presentation/widgets/w_main_content.dart';

class CategoryContentListScreen extends StatefulWidget {
  const CategoryContentListScreen({super.key, required this.categoryId});
  final int categoryId;
  @override
  State<CategoryContentListScreen> createState() =>
      _CategoryContentListScreenState();
}

class _CategoryContentListScreenState
    extends PageStateful<CategoryContentListScreen, CategoryContentBloc> {
  bool enabledLoadMore = false;
  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    bloc.initial(widget.categoryId);
  }

  String mapTitleWithId() {
    switch (widget.categoryId) {
      case 8:
        return LocaleKeys.home_categories_cat_8_title.tr();
      case 9:
        return LocaleKeys.home_categories_cat_9_title.tr();
      default:
        return LocaleKeys.home_categories_cat_8_title.tr();
    }
  }

  @override
  Widget buildPage(BuildContext context, CategoryContentBloc bloc) {
    return BlocListener<CategoryContentBloc, CategoryContentState>(
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
            enabledLoadMore = data;
          },
          failure: (error) async {
            showLoading(context, false);
          },
        );
      },
      listenWhen: ((previous, current) => previous.status != current.status),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppHeader(
          context,
          titleText: LocaleKeys.home_categories_content_title.tr(),
        ),
        body: BlocBuilder<CategoryContentBloc, CategoryContentState>(
          buildWhen: (previous, current) =>
              previous.listCategoryContent != current.listCategoryContent,
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.paddingWithScreen,
              ),
              child: RefreshLoadMoreDataWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mapTitleWithId(),
                      style: AppStyles.text18.preBold,
                    ),
                    AppSize.paddingWithScreen.verticalSpace,
                    Expanded(
                      child: RefreshLoadMoreDataWidget(
                        onRefresh: () async => bloc.initial(widget.categoryId),
                        onLoadMore: () async => enabledLoadMore
                            ? bloc.loadMore(widget.categoryId)
                            : null,
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return WMainContent(
                                  likeContent:
                                      state.listCategoryContent[index]);
                            },
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                child: const Divider(
                                  thickness: 1,
                                ),
                              );
                            },
                            itemCount: state.listCategoryContent.length),
                      ),
                    ),
                    AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
