import 'package:borra_app/src/content_result/data/models/content_detail_model.dart';
import 'package:borra_app/src/content_result/data/models/group_saju_content.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../data/models/children_data_model.dart';
import '../../data/models/content_children_model.dart';
import '../widgets/w_purchase_header.dart';
import '../widgets/w_saju_content.dart';

class FormSajuResult extends StatefulWidget {
  const FormSajuResult({
    super.key,
    required this.contentResult,
    required this.isLiked,
  });

  final ContentResult contentResult;
  final bool isLiked;

  @override
  State<FormSajuResult> createState() => _FormSajuResultState();
}

class _FormSajuResultState extends State<FormSajuResult> {
  List<ChildrenData> lastChildrenData = [];
  ContentChildren? lastItemChild;

  @override
  void initState() {
    for (var element in widget.contentResult.children) {
      if (element.sign == null) {
        lastItemChild = element;
        var list = widget.contentResult.childrenData
            .where((element) =>
                element.childId == lastItemChild?.id &&
                element.template?.id == 7)
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
    List<List<ContentChildren>> groupedChildren = [];

    // Group children by parentId
    Map<int, List<ContentChildren>> groupedMap = {};
    for (var child in resultChildren) {
      if (!groupedMap.containsKey(child.parentId)) {
        groupedMap[child.parentId] = [];
      }
      groupedMap[child.parentId]!.add(child);
    }

// Convert the grouped map to a list of lists
    groupedChildren = groupedMap.values.toList();
    List<GroupSajuContent> resultChildrenData = [];
    // List<List<ChildrenData>> resultChildrenData = [];
    // List<ChildrenData> currentList = [];
    resultChildrenData = groupedChildren.map((e1) {
      return GroupSajuContent(
          groupTitle: widget.contentResult.parents
                  .firstWhereOrNull(
                    (parents) => parents.id == e1.first.parentId,
                  )
                  ?.name ??
              "",
          resultChildrenData: e1.map(
            (e) {
              return widget.contentResult.childrenData
                  .where(
                    (element) => element.childId == e.id,
                  )
                  .toList();
            },
          ).toList());
    }).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
      child: Column(
        children: [
          WSajuPurchaseHeader(
              purchaseInfo: widget.contentResult.purchase,
              sajuDetail: widget.contentResult.saju!.first,
              isLiked: widget.isLiked,
              contentId: widget.contentResult.content.id),
          if (widget.contentResult.purchase.partner != null) ...[
            AppSize.space15.verticalSpace,
            WSajuPurchaseHeader(
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
              if (lastChildrenData.isNotEmpty &&
                  index == resultChildrenData.length - 1) {
                return const SizedBox();
              }
              return Container(
                padding: EdgeInsets.all(AppSize.paddingWithScreen),
                decoration: AppStyles.containerDecoration,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (resultChildrenData[index].groupTitle != null &&
                          resultChildrenData[index].groupTitle != 'null') ...[
                        Text(
                          resultChildrenData[index].groupTitle,
                          style: AppStyles.text20.preBold,
                        ),
                        AppSize.space15.verticalSpace,
                      ],
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          var result = resultChildren.firstWhereOrNull(
                              (element) =>
                                  element.id ==
                                  resultChildrenData[index]
                                      .resultChildrenData[i]
                                      .first
                                      .childId);
                          return WSajuContent(
                            signUrl: AppImages.getIconSign(result?.sign ?? ''),
                            contentTitle: result?.name ?? '',
                            children:
                                resultChildrenData[index].resultChildrenData[i],
                            purchase: widget.contentResult.purchase,
                          );
                        },
                        separatorBuilder: (_, __) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSize.paddingWithScreen),
                            child: Divider(
                              height: 0.r,
                              color: AppColors.black.withOpacity(0.3),
                            ),
                          );
                        },
                        itemCount:
                            resultChildrenData[index].resultChildrenData.length,
                      ),
                      // ...resultChildrenData[index].resultChildrenData.map((e) {
                      //   var result = resultChildren.firstWhereOrNull(
                      //       (element) => element.id == e.first.childId);
                      //   // if (result?.sign == null) {
                      //   //   print("ind: $index");
                      //   //   return const SizedBox.shrink();
                      //   // }
                      //   return WSajuContent(
                      //     signUrl: AppImages.getIconSign(result?.sign ?? ''),
                      //     contentTitle: result?.name ?? '',
                      //     children: e,
                      //     purchase: widget.contentResult.purchase,
                      //   );
                      // }).toList(),
                    ]),
              );
              // }
            },
            separatorBuilder: (_, __) {
              return AppSize.space15.verticalSpace;
            },
            itemCount:
                resultChildrenData.length - (lastChildrenData.isEmpty ? 0 : 1),
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
