import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_routes.dart';
import '../../../../common/widgets/app_image.dart';
import '../../data/models/banner.dart';

class WBanner extends StatelessWidget {
  const WBanner({
    Key? key,
    required this.banner,
    this.fit,
  }) : super(key: key);
  final AppBanner banner;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    final double widgetHeight = 202.h;
    final link = Uri.parse(banner.link);
    final page = link.path.split('/')[1];
    final id = link.path.split('/')[2];
    return InkWell(
      onTap: () => Navigator.pushNamed(
          context,
          page == "contents"
              ? AppRoutesMain.contentDetail
              : AppRoutesMain.contentCategoryList,
          arguments: int.parse(id)),
      child: AppImage(
        imageUrl: banner.thumbnail,
        // height: widgetHeight,
        width: double.infinity,
        fit: fit,
      ),
    );
  }
}
