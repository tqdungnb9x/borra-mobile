import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/widgets/dialogs/w_app_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../data/models/tag.dart';

class WTagList extends StatefulWidget {
  const WTagList(
      {super.key,
      this.userTags,
      required this.onSelectedTag,
      required this.listTag});
  final List<int>? userTags;
  final List<AppTag> listTag;
  final ValueChanged<AppTag> onSelectedTag;
  @override
  State<WTagList> createState() => _WTagListState();
}

class _WTagListState extends State<WTagList> {
  List<int> selectedIDs = [];
  @override
  void initState() {
    super.initState();
    if (widget.userTags != null) {
      selectedIDs.addAll(widget.userTags!);
    } else {
      final sortedTags = [...widget.listTag]
        ..sort((a, b) => a.id.compareTo(b.id));
      selectedIDs = sortedTags.sublist(0, 3).map((e) => e.id).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSize.spaceBetweenWidgetExtraSmall,
      runSpacing: AppSize.spaceBetweenWidgetExtraSmall,
      children: [
        for (final tag in widget.listTag)
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                selectedIDs = [tag.id];
                widget.onSelectedTag(tag);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.r,
                vertical: AppSize.spaceMedium,
              ),
              decoration: BoxDecoration(
                  color: selectedIDs.contains(tag.id)
                      ? AppColors.primary01.withOpacity(.12)
                      : AppColors.white,
                  border: Border.all(
                    color: AppColors.black.withOpacity(.08),
                  ),
                  borderRadius: BorderRadius.circular(100)),
              child: Text(
                tag.name,
                style: AppStyles.text14.preReg.copyWith(
                    color: selectedIDs.contains(tag.id)
                        ? AppColors.primary01
                        : AppColors.black.withOpacity(.8)),
              ),
            ),
          ),
      ],
    );
  }
}

class WTagUserList extends StatefulWidget {
  const WTagUserList(
      {super.key,
      this.userTags,
      required this.onSelectedTag,
      required this.listTag});
  final List<int>? userTags;
  final List<AppTag> listTag;
  final ValueChanged<List<int>> onSelectedTag;
  @override
  State<WTagUserList> createState() => _WTagUserListState();
}

class _WTagUserListState extends State<WTagUserList> {
  late List<int> selectedIDs;
  @override
  void initState() {
    super.initState();
    selectedIDs = [];
    selectedIDs.addAll(widget.userTags ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSize.spaceBetweenWidgetExtraSmall,
      runSpacing: AppSize.spaceBetweenWidgetExtraSmall,
      children: [
        for (final tag in widget.listTag)
          InkWell(
            splashColor: Colors.transparent,
            onTap: () async {
              setState(() {
                if (selectedIDs.contains(tag.id)) {
                  selectedIDs.remove(tag.id);
                } else if (selectedIDs.length < 3) {
                  selectedIDs.add(tag.id);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return WAppDialog(
                        content: LocaleKeys.app_dialog_select_3_tag.tr(),
                      );
                    },
                  );
                  return;
                }
                widget.onSelectedTag(selectedIDs);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.r,
                vertical: AppSize.spaceMedium,
              ),
              decoration: BoxDecoration(
                  color: selectedIDs.contains(tag.id)
                      ? AppColors.primary01.withOpacity(.12)
                      : AppColors.white,
                  border: Border.all(
                    color: AppColors.black.withOpacity(.08),
                  ),
                  borderRadius: BorderRadius.circular(100)),
              child: Text(
                tag.name,
                style: AppStyles.text14.preReg.copyWith(
                    color: selectedIDs.contains(tag.id)
                        ? AppColors.primary01
                        : AppColors.black.withOpacity(.8)),
              ),
            ),
          ),
      ],
    );
  }
}
