import 'package:borra_app/app_base/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.neutral07,
      highlightColor: AppColors.neutral06.withOpacity(0.77),
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
