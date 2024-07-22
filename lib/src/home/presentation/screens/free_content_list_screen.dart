import 'dart:async';

import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/refresh_load_more_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../like/presentation/widgets/w_main_content.dart';
import '../../business_logic/free_content/free_content_bloc.dart';

class FreeContentListScreen extends StatefulWidget {
  const FreeContentListScreen({super.key});

  @override
  State<FreeContentListScreen> createState() => _FreeContentListScreenState();
}

class _FreeContentListScreenState
    extends PageStateful<FreeContentListScreen, FreeContentBloc> {
  Completer? completerLoad;
  bool enabledLoadMore = false;
  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    bloc.initial();
  }

  @override
  Widget buildPage(BuildContext context, FreeContentBloc bloc) {
    return BlocListener<FreeContentBloc, FreeContentState>(
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
      child: BlocListener<FreeContentBloc, FreeContentState>(
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
            titleText: LocaleKeys.home_free_content_title.tr(),
          ),
          body: BlocBuilder<FreeContentBloc, FreeContentState>(
            buildWhen: (previous, current) =>
                previous.listFreeContent != current.listFreeContent,
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.paddingWithScreen,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.home_free_content_header.tr(),
                      style: AppStyles.text18.preBold,
                    ),
                    AppSize.paddingWithScreen.verticalSpace,
                    Expanded(
                      child: RefreshLoadMoreDataWidget(
                        onRefresh: () async => bloc.initial(),
                        onLoadMore: () async =>
                            enabledLoadMore ? bloc.loadMore() : null,
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return WMainContent(
                                  likeContent: state.listFreeContent[index]);
                            },
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                child: const Divider(
                                  thickness: 1,
                                ),
                              );
                            },
                            itemCount: state.listFreeContent.length),
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
    );
  }
}
