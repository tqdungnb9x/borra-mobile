import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_base/config/app_config.dart';
import 'w_skeleton.dart';

class ImageWidget extends Image {
  const ImageWidget({
    super.key,
    required super.image,
    super.frameBuilder,
    super.loadingBuilder,
    super.errorBuilder,
    super.semanticLabel,
    super.excludeFromSemantics,
    super.width,
    super.height,
    super.color,
    super.opacity,
    super.colorBlendMode,
    super.fit,
    super.alignment,
    super.repeat,
    super.centerSlice,
    super.matchTextDirection,
    super.gaplessPlayback,
    super.isAntiAlias,
    super.filterQuality,
  });

  ImageWidget.network(
    super.src, {
    super.key,
    super.scale,
    super.frameBuilder,
    super.loadingBuilder,
    super.errorBuilder,
    super.semanticLabel,
    super.excludeFromSemantics,
    super.width,
    super.height,
    super.color,
    super.opacity,
    super.colorBlendMode,
    super.fit,
    super.alignment,
    super.repeat,
    super.centerSlice,
    super.matchTextDirection,
    super.gaplessPlayback,
    super.filterQuality,
    super.isAntiAlias,
    super.headers,
    super.cacheWidth,
    super.cacheHeight,
  }) : super.network();

  ImageWidget.file(
    super.file, {
    super.key,
    super.scale,
    super.frameBuilder,
    super.errorBuilder,
    super.semanticLabel,
    super.excludeFromSemantics,
    super.width,
    super.height,
    super.color,
    super.opacity,
    super.colorBlendMode,
    super.fit,
    super.alignment,
    super.repeat,
    super.centerSlice,
    super.matchTextDirection,
    super.gaplessPlayback,
    super.isAntiAlias,
    super.filterQuality,
    super.cacheWidth,
    super.cacheHeight,
  }) : super.file();

  ImageWidget.asset(
    super.name, {
    super.key,
    super.bundle,
    super.frameBuilder,
    super.errorBuilder,
    super.semanticLabel,
    super.excludeFromSemantics,
    super.scale,
    super.width,
    super.height,
    super.color,
    super.opacity,
    super.colorBlendMode,
    super.fit,
    super.alignment,
    super.repeat,
    super.centerSlice,
    super.matchTextDirection,
    super.gaplessPlayback,
    super.isAntiAlias,
    super.package,
    super.filterQuality,
    super.cacheWidth,
    super.cacheHeight,
  }) : super.asset();

  ImageWidget.memory(
    super.bytes, {
    super.key,
    super.scale,
    super.frameBuilder,
    super.errorBuilder,
    super.semanticLabel,
    super.excludeFromSemantics,
    super.width,
    super.height,
    super.color,
    super.opacity,
    super.colorBlendMode,
    super.fit,
    super.alignment,
    super.repeat,
    super.centerSlice,
    super.matchTextDirection,
    super.gaplessPlayback,
    super.isAntiAlias,
    super.filterQuality,
    super.cacheWidth,
    super.cacheHeight,
  }) : super.memory();

  @override
  ImageErrorWidgetBuilder? get errorBuilder => (context, error, stackTrace) {
        return const _ErrorWidgget();
      };

  @override
  ImageLoadingBuilder? get loadingBuilder => (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const _LoadingWidget();
      };

  @override
  ImageFrameBuilder? get frameBuilder =>
      (context, child, frame, wasSynchronouslyLoaded) {
        if (frame != null) return child;
        return Container(
          color: AppColors.neutral07,
        );
      };
}

class SvgWidget extends SvgPicture {
  const SvgWidget(super.pictureProvider,
      {super.key,
      super.width,
      super.height,
      super.fit,
      super.alignment,
      super.matchTextDirection,
      super.allowDrawingOutsideViewBox,
      super.placeholderBuilder,
      super.colorFilter,
      super.semanticsLabel,
      super.excludeFromSemantics,
      super.clipBehavior,
      super.cacheColorFilter,
      super.theme})
      : super();

  SvgWidget.asset(
    super.assetName, {
    super.key,
    super.matchTextDirection,
    super.bundle,
    super.package,
    super.width,
    super.height,
    super.fit,
    super.alignment,
    super.allowDrawingOutsideViewBox,
    super.placeholderBuilder,
    super.color,
    super.colorBlendMode,
    super.semanticsLabel,
    super.excludeFromSemantics,
    super.clipBehavior,
    super.cacheColorFilter,
    super.theme,
  }) : super.asset();

  SvgWidget.network(
    super.url, {
    super.key,
    super.headers,
    super.width,
    super.height,
    super.fit,
    super.alignment,
    super.matchTextDirection,
    super.allowDrawingOutsideViewBox,
    super.placeholderBuilder,
    super.color,
    super.colorBlendMode,
    super.semanticsLabel,
    super.excludeFromSemantics,
    super.clipBehavior,
    super.cacheColorFilter,
    super.theme,
  }) : super.network();

  SvgWidget.file(
    super.file, {
    super.key,
    super.width,
    super.height,
    super.fit,
    super.alignment,
    super.matchTextDirection,
    super.allowDrawingOutsideViewBox,
    super.placeholderBuilder,
    super.color,
    super.colorBlendMode,
    super.semanticsLabel,
    super.excludeFromSemantics,
    super.clipBehavior,
    super.cacheColorFilter,
    super.theme,
  }) : super.file();

  SvgWidget.memory(
    super.bytes, {
    super.key,
    super.width,
    super.height,
    super.fit,
    super.alignment,
    super.matchTextDirection,
    super.allowDrawingOutsideViewBox,
    super.placeholderBuilder,
    super.color,
    super.colorBlendMode,
    super.semanticsLabel,
    super.excludeFromSemantics,
    super.clipBehavior,
    super.cacheColorFilter,
    super.theme,
  }) : super.memory();

  @override
  WidgetBuilder? get placeholderBuilder => (context) {
        return const _LoadingWidget();
      };
}

class _ErrorWidgget extends StatelessWidget {
  const _ErrorWidgget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neutral06,
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SkeletonWidget();
  }
}
