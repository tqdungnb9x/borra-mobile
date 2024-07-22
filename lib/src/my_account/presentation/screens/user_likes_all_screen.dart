import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/refresh_load_more_data.dart';
import 'package:borra_app/src/my_account/business_logic/account_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/generated/locale_keys.g.dart';
import '../../../like/presentation/widgets/w_main_content.dart';

class UserLikedAllScreen extends StatefulWidget {
  const UserLikedAllScreen({super.key});

  @override
  State<UserLikedAllScreen> createState() => _UserLikedAllScreenState();
}

class _UserLikedAllScreenState
    extends PageStateful<UserLikedAllScreen, AccountBloc> {
  bool enabledLoadMore = false;
  @override
  void afterFirstBuild(BuildContext context) {
    bloc.loadLikedList();
    super.afterFirstBuild(context);
  }

  @override
  Widget buildPage(BuildContext context, AccountBloc bloc) {
    return BlocListener<AccountBloc, AccountState>(
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
      listenWhen: (previous, current) => previous.status != current.status,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppHeader(
          context,
          titleText: LocaleKeys.dashboard_my_account.tr(),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.paddingWithScreen,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.dashboard_favourite.tr(),
                style: AppStyles.text18.preBold,
              ),
              AppSize.paddingWithScreen.verticalSpace,
              BlocBuilder<AccountBloc, AccountState>(
                buildWhen: (previous, current) =>
                    previous.listUserLiked != current.listUserLiked,
                builder: (context, state) {
                  if (state.listUserLiked == null) {
                    return const SizedBox();
                  }
                  return Expanded(
                    child: RefreshLoadMoreDataWidget(
                      onRefresh: () async => bloc.loadLikedList(),
                      onLoadMore: () async =>
                          enabledLoadMore ? bloc.loadLikedListMore() : null,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return WMainContentUser(
                                likeContent: state.listUserLiked![index]);
                          },
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              child: const Divider(
                                thickness: 1,
                              ),
                            );
                          },
                          itemCount: state.listUserLiked!.length),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
