import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../app_base/config/app_config.dart';

class AppImage extends StatelessWidget {
  const AppImage(
      {super.key, this.height, this.width, required this.imageUrl, this.fit});
  final double? height;
  final double? width;
  final String imageUrl;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      // placeholder: (context, url) => Image.asset(
      //   AppImages.imgDefaultThumbnail,
      //   fit: fit ?? BoxFit.cover,
      // ),
      errorWidget: (context, url, error) => Image.asset(
        AppImages.imgDefaultThumbnail,
        fit: fit ?? BoxFit.cover,
      ),
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
    );
  }
}
