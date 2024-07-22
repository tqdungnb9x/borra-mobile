import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/src/content_recommend/business_logic/recommend/recommend_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_base/config/app_config.dart';
import '../../../app_base/config/app_routes.dart';
import '../../home/presentation/widgets/w_section_header.dart';
import '../../home/presentation/widgets/w_tarot_today.dart';

class FormRecommend extends StatefulWidget {
  const FormRecommend({super.key});

  @override
  State<FormRecommend> createState() => _FormRecommendState();
}

class _FormRecommendState extends PageStateful<FormRecommend, RecommendBloc> {
  @override
  void afterFirstBuild(BuildContext context) {
    bloc.initial();
    super.afterFirstBuild(context);
  }

  @override
  Widget buildPage(BuildContext context, RecommendBloc bloc) {
    return BlocBuilder<RecommendBloc, RecommendState>(
      buildWhen: (previous, current) =>
          previous.listRecommend != current.listRecommend,
      builder: (context, state) {
        if (state.listRecommend.isEmpty) {
          return Container();
        }
        return Padding(
          padding: EdgeInsets.all(AppSize.paddingWithScreen),
          child: Column(
            children: [
              WSectionHeader(
                headerTitle:
                    LocaleKeys.content_detail_result_feedback_title.tr(),
                functionTitle:
                    LocaleKeys.content_detail_result_recommend_title.tr(),
                onFunctionTitleClick: () {
                  Navigator.pushNamed(context, AppRoutesMain.hotContentList);
                },
              ),
              AppSize.paddingWithScreen.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: state.listRecommend
                    .map((e) => WContentWithLike(
                          tarotToday: e,
                          isLiked: e.isLiked ?? false,
                        ))
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
