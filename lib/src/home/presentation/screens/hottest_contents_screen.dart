import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/src/home/business_logic/blocs/home_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../widgets/w_hot_content.dart';

class HottestContentScreen extends StatefulWidget {
  const HottestContentScreen({super.key});

  @override
  State<HottestContentScreen> createState() => _HottestContentScreenState();
}

class _HottestContentScreenState
    extends PageStateful<HottestContentScreen, HomeBloc> {
  @override
  Widget buildPage(BuildContext context, HomeBloc bloc) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.listHotContent != current.listHotContent,
      builder: (context, state) {
        if (state.listHotContent == null) {
          return Container();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.paddingWithScreen,
                vertical: AppSize.paddingWithScreen,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    LocaleKeys.home_hot_content_section_header.tr(),
                    style: AppStyles.text24.preBold,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutesMain.hotContentList),
                    child: Text(
                      LocaleKeys.home_common_view_all.tr(),
                      style: AppStyles.text16.preReg
                          .copyWith(color: AppColors.primary01),
                    ),
                  )
                ],
              ),
            ),
            5.horizontalSpace,
            Container(
              height: 280.h,
              padding:
                  EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
              alignment: Alignment.topLeft,
              child: ListView.separated(
                clipBehavior: Clip.none,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return WHotContent(hotContent: state.listHotContent![index]);
                },
                separatorBuilder: (context, index) {
                  return AppSize.spaceBetweenWidgetExtraLarge.horizontalSpace;
                },
                itemCount: state.listHotContent!.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
