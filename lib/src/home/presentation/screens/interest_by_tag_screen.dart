import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/src/home/business_logic/blocs/home_bloc.dart';
import 'package:borra_app/src/home/presentation/screens/tag_all_content_screen.dart';
import 'package:borra_app/src/home/presentation/widgets/w_section_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../data/models/tag.dart';
import '../widgets/w_tag_list.dart';
import '../widgets/w_tarot_today.dart';

class InterestByTagScreen extends StatefulWidget {
  InterestByTagScreen({
    super.key,
  });
  @override
  State<InterestByTagScreen> createState() => _InterestByTagScreenState();
}

class _InterestByTagScreenState
    extends PageStateful<InterestByTagScreen, HomeBloc> {
  int? tagId;
  @override
  Widget buildPage(BuildContext context, HomeBloc bloc) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.listTag != current.listTag,
      builder: (context, state) {
        if (state.listTag == null && state.selectedTag == null) {
          return Container();
        }
        if (state.selectedTag != null) {
          tagId = state.selectedTag!.id;
        }

        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.paddingWithScreen,
                vertical: AppSize.paddingWithScreen,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.home_tag_section_header.tr(),
                    style: AppStyles.text20.preBold,
                  ),
                  AppSize.spaceBetweenWidgetExtraMedium.verticalSpace,
                  WTagList(
                    onSelectedTag: (AppTag value) {
                      tagId = value.id;
                      bloc.add(SelectCategory(value));
                    },
                    listTag: state.listTag!,
                    userTags: MainBloc.authBloc.state.user?.tags,
                  ),
                  56.verticalSpace,
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) =>
                        previous.listTarotByCategory !=
                        current.listTarotByCategory,
                    builder: (context, state) {
                      if (state.listTarotByCategory == null) {
                        return SizedBox(
                          width: double.infinity,
                          height: 202.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      return Column(
                        children: [
                          WSectionHeader(
                            headerTitle: state.tagHeader,
                            onFunctionTitleClick: () => Navigator.pushNamed(
                              context,
                              AppRoutesMain.tagAllContentList,
                              arguments: TagAllContentScreenArguments(
                                  tag: state.selectedTag,
                                  listTags: state.listTag!),
                            ),
                          ),
                          AppSize.paddingWithScreen.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: state.listTarotByCategory!
                                .map((e) => WTarotFree(tarotToday: e))
                                .toList(),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
