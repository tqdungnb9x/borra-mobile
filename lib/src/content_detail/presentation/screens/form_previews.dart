import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app_base/config/app_config.dart';
import '../../business_logic/content_detail/content_detail_bloc.dart';

class FormPreviews extends StatelessWidget {
  const FormPreviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentDetailBloc, ContentDetailState>(
      buildWhen: (previous, current) =>
          previous.listPreview != current.listPreview,
      builder: (context, state) {
        if (state.listPreview.isEmpty) {
          return const SizedBox();
        }
        return Container(
          padding:
              EdgeInsets.only(left: 17.r, right: 17.r, top: 18.r, bottom: 18.r),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.black.withOpacity(0.08)),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 6),
                spreadRadius: 0,
              )
            ],
          ),
          child: ListView.separated(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              if (state.listPreview[index].name == null ||
                  state.listPreview[index].sign == null) {
                return const SizedBox.shrink();
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.network(
                    AppImages.getIconSign(state.listPreview[index].sign!),
                    width: 18.r,
                    height: 18.r,
                  ),
                  AppSize.spaceBetweenWidgetSmall.horizontalSpace,
                  Text(
                    state.listPreview[index].name!,
                    style: AppStyles.text16.preMed,
                  )
                ],
              );
            },
            separatorBuilder: (_, __) => (state.listPreview[__].name == null ||
                    state.listPreview[__].sign == null)
                ? const SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppSize.spaceBetweenWidgetExtraMedium),
                    child: const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                  ),
            itemCount: state.listPreview.length,
          ),
        );
      },
    );
  }
}
