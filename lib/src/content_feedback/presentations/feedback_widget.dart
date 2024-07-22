import 'package:another_flushbar/flushbar.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/src/content_feedback/business_logic/feedback/feedback_bloc.dart';
import 'package:borra_app/src/home/business_logic/blocs/home_bloc.dart';
import 'package:borra_app/src/splash/business_logic/blocs/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_base/config/app_config.dart';

class FormFeedback extends StatefulWidget {
  const FormFeedback({
    super.key,
    required this.contentId,
    this.purchaseId,
  });
  final int contentId;
  final int? purchaseId;
  @override
  State<FormFeedback> createState() => _FormFeedbackState();
}

class _FormFeedbackState extends PageStateful<FormFeedback, FeedbackBloc> {
  @override
  void afterFirstBuild(BuildContext context) {
    bloc.initial(widget.contentId, widget.purchaseId);
    super.afterFirstBuild(context);
  }

  @override
  Widget buildPage(BuildContext context, FeedbackBloc bloc) {
    return BlocListener<FeedbackBloc, FeedbackState>(
      listener: (context, state) {
        state.statusPost.whenOrNull(
          success: (data) async {
            if (state.feedbackContent != null) {
              UiUtils.showInfoSnackBar(context,
                  message: state.feedbackContent!.message,
                  position: FlushbarPosition.BOTTOM);
              MainBloc.authBloc.getUserInfo();
            }
          },
          failure: (error) async {
            UiUtils.showInfoSnackBar(context,
                message: "이미 남긴 구매 피드백", position: FlushbarPosition.BOTTOM);
            showLoading(context, false);
          },
        );
      },
      listenWhen: ((previous, current) =>
          previous.statusPost != current.statusPost),
      child: BlocBuilder<FeedbackBloc, FeedbackState>(
        buildWhen: (previous, current) =>
            previous.listFeedback != current.listFeedback,
        builder: (context, state) {
          if (state.listFeedback.isEmpty) {
            return const SizedBox();
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: state.listFeedback
                .map(
                  (e) => Column(
                    children: [
                      BlocBuilder<FeedbackBloc, FeedbackState>(
                        buildWhen: (previous, current) =>
                            previous.feedbackResult != current.feedbackResult,
                        builder: (context, state) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: state.feedbackResult == null &&
                                    widget.purchaseId != null
                                ? () {
                                    bloc.add(PostFeedback(e.id,
                                        widget.contentId, widget.purchaseId!));
                                  }
                                : null,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: e.id == state.feedbackResult
                                          ? AppColors.primary01
                                          : Colors.transparent,
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: Image.asset(AppImages.mapIconWithId(e.id)),
                            ),
                          );
                        },
                      ),
                      AppSize.spaceBetweenWidgetSmall.verticalSpace,
                      Text(
                        '${e.count}',
                        style: AppStyles.text14.preMed
                            .copyWith(color: AppColors.primary01),
                      ),
                      AppSize.spaceBetweenWidgetSmall.verticalSpace,
                      Text(
                        e.name,
                        style: AppStyles.text13,
                      ),
                    ],
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
