import 'package:borra_app/src/content_result/data/models/content_detail_model.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../common/widgets/app_image.dart';
import '../widgets/w_content_info.dart';

class FormJuyeogResult extends StatelessWidget {
  const FormJuyeogResult({super.key, required this.contentResult});
  final ContentResult contentResult;
  @override
  Widget build(BuildContext context) {
    String mainImageName = contentResult.purchase.value!;
    mainImageName = mainImageName.replaceAll(',', '_');
    var resultChildren = contentResult.children.sorted((a, b) {
      if (a.parentId == b.parentId) {
        return a.order - b.order;
      } else {
        return a.parentId - b.parentId;
      }
    });
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppSize.paddingWithScreen),
            decoration: AppStyles.containerDecoration,
            child: AppImage(
              imageUrl: AppImages.getJuyeogResult(mainImageName),
            ),
          ),
          AppSize.space15.verticalSpace,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var result = resultChildren[index];
              var childrenData = contentResult.childrenData
                  .where((element) => element.childId == result.id)
                  .toList();
              return WContentInfo(
                  signUrl: AppImages.getIconSign(result.sign!),
                  contentTitle: result.name!,
                  children: childrenData);
            },
            separatorBuilder: (_, __) {
              return AppSize.space15.verticalSpace;
            },
            itemCount: contentResult.children.length,
          ),
        ],
      ),
    );
  }
}
