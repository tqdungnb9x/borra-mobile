import 'package:borra_app/src/content_result/data/models/content_detail_model.dart';
import 'package:borra_app/src/content_result/presentation/widgets/w_purchase_header_replays.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../data/models/children_data_model.dart';
import '../../data/models/content_children_model.dart';
import '../widgets/w_saju_content.dart';

class FormSajuResultReplays extends StatefulWidget {
  const FormSajuResultReplays({
    super.key,
    required this.contentResult,
    required this.isLiked,
  });
  final ContentResult contentResult;
  final bool isLiked;

  @override
  State<FormSajuResultReplays> createState() => _FormSajuResultReplaysState();
}

class _FormSajuResultReplaysState extends State<FormSajuResultReplays> {
  ContentChildren? lastItemChild;
  List<ChildrenData> lastChildrenData = [];
  @override
  void initState() {
    for (var element in widget.contentResult.children) {
      if (element.sign == null) {
        lastItemChild = element;
        var list = widget.contentResult.childrenData
            .where((element) => element.childId == lastItemChild!.id)
            .toList();
        lastChildrenData.addAll(list);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var resultChildren = widget.contentResult.children.sorted((a, b) {
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
          WSajuPurchaseHeaderReplays(
              purchaseInfo: widget.contentResult.purchase,
              sajuDetail: widget.contentResult.saju!.first,
              isLiked: widget.isLiked,
              contentId: widget.contentResult.content.id),
          if (widget.contentResult.purchase.partner != null) ...[
            AppSize.space15.verticalSpace,
            WSajuPurchaseHeaderReplays(
                sajuDetail: widget.contentResult.saju!.last,
                purchaseInfo: widget.contentResult.purchase.partner,
                isLiked: widget.isLiked,
                contentId: widget.contentResult.content.id)
          ],
          AppSize.space15.verticalSpace,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var result = resultChildren[index];
              var childrenData = widget.contentResult.childrenData
                  .where((element) => element.childId == result.id)
                  .toList();
              if (result.sign == null) {
                return const SizedBox.shrink();
              }
              return WSajuContent(
                signUrl: AppImages.getIconSign(result.sign ?? ''),
                contentTitle: result.name ?? '',
                children: childrenData,
                purchase: widget.contentResult.purchase,
              );
            },
            separatorBuilder: (_, __) {
              if (widget.contentResult.children[__].sign == null) {
                return const SizedBox.shrink();
              }
              return AppSize.space15.verticalSpace;
            },
            itemCount: widget.contentResult.children.length,
          ),
          lastChildrenData.isNotEmpty
              ? Container(
                  padding: EdgeInsets.all(AppSize.paddingWithScreen),
                  decoration: AppStyles.containerDecoration,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppSize.paddingWithScreen,
                        horizontal: AppSize.space24),
                    decoration: BoxDecoration(
                        color: AppColors.primary01.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(AppSize.radius6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: lastChildrenData
                          .map((e) => Column(
                                children: [
                                  Text(
                                    e.name ?? '',
                                    style: AppStyles.text12.preMed.copyWith(
                                      color: AppColors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  Text(
                                    e.contents ?? "",
                                    style: AppStyles.text18.preSemiBold,
                                  )
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
