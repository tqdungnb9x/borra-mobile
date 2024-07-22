import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/src/home_notice/business_logic/notice_bloc.dart';
import 'package:borra_app/src/home_notice/data/models/notice_model.dart';
import 'package:borra_app/src/home_notice/presentation/widgets/w_notice_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/utils/app_utils.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key, required this.type});
  final String type;
  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends PageStateful<NoticeScreen, NoticeBloc> {
  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    bloc.initial(widget.type);
  }

  @override
  Widget buildPage(BuildContext context, NoticeBloc bloc) {
    return BlocListener<NoticeBloc, NoticeState>(
      listener: (context, state) {
        state.status.whenOrNull(idle: () {
          showLoading(context, false);
        }, loading: () {
          showLoading(context, true);
        }, success: ((data) async {
          showLoading(context, false);
        }), failure: (error) {
          showLoading(context, false);
          UiUtils.showInfoSnackBar(
            context,
            message: error.toString(),
          );
        });
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppHeader(
          context,
          onTitleClicked: () => Navigator.of(context).pop(),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.paddingWithScreen,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.type == NoticeType.notice.name
                    ? LocaleKeys.home_common_notice_title.tr()
                    : LocaleKeys.home_common_faq_title.tr(),
                style: AppStyles.text18.preBold,
              ),
              AppSize.paddingWithScreen.verticalSpace,
              BlocBuilder<NoticeBloc, NoticeState>(
                buildWhen: (previous, current) =>
                    previous.listNotice != current.listNotice,
                builder: (context, state) {
                  if (state.listNotice == null) {
                    return const SizedBox.shrink();
                  }
                  if (state.listNotice!.isEmpty) {
                    return Text(
                      LocaleKeys.common_no_content.tr(),
                      style: AppStyles.text14.preReg,
                    );
                  }
                  return widget.type == NoticeType.notice.name
                      ? Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return WNoticeItem(
                                    notice: state.listNotice![index]);
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 1,
                                );
                              },
                              itemCount: state.listNotice!.length),
                        )
                      : Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return WFaqItem(
                                    notice: state.listNotice![index]);
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 1,
                                );
                              },
                              itemCount: state.listNotice!.length),
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
