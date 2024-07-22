import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../app_base/config/app_config.dart';

class RefreshLoadMoreDataWidget extends StatefulWidget {
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onLoadMore;
  final Widget child;
  final bool? enableLoadmore;
  final ScrollController? scrollController;
  const RefreshLoadMoreDataWidget(
      {Key? key,
      this.onRefresh,
      this.onLoadMore,
      this.enableLoadmore = false,
      required this.child,
      this.scrollController})
      : super(key: key);

  @override
  State<RefreshLoadMoreDataWidget> createState() =>
      _RefreshLoadMoreDataWidgetState();
}

class _RefreshLoadMoreDataWidgetState extends State<RefreshLoadMoreDataWidget>
    with TickerProviderStateMixin {
  late final RefreshController refreshController = RefreshController(
    initialRefresh: false,
    initialLoadStatus: LoadStatus.idle,
    initialRefreshStatus: RefreshStatus.idle,
  );
  late final Future<void> Function() onRefreshL;
  late final Future<void> Function() onLoadMoreL;
  // Animation Indicator
  late final AnimationController animationRefreshController;
  late final Animation<double> animationRefresh;
  late final AnimationController animationLoadController;
  late final Animation<double> animationLoad;

  @override
  void initState() {
    super.initState();
    _setupExecuteFunction();
    _setupAnimation();
  }

  void _setupExecuteFunction() {
    onRefreshL = () async {
      await widget.onRefresh?.call();
      refreshController.refreshCompleted();
    };

    onLoadMoreL = () async {
      await widget.onLoadMore?.call();
      refreshController.loadComplete();
    };
  }

  void _setupAnimation() {
    animationRefreshController = AnimationController(
      vsync: this,
    );
    animationRefresh =
        Tween(begin: 0.0, end: 1.0).animate(animationRefreshController);

    animationLoadController = AnimationController(
      vsync: this,
    );
    animationLoad =
        Tween(begin: 0.0, end: 1.0).animate(animationLoadController);
  }

  @override
  Widget build(BuildContext context) {
    const height = 80.0;
    Widget child = SmartRefresher(
      controller: refreshController,
      enablePullDown: widget.onRefresh != null,
      enablePullUp: widget.onLoadMore != null,
      onLoading: onLoadMoreL,
      scrollController: widget.scrollController,
      onRefresh: onRefreshL,
      header: Platform.isIOS
          ? CustomHeader(
              height: height,
              refreshStyle: RefreshStyle.Follow,
              onOffsetChange: (offset) {
                animationRefreshController.value = (offset / height);
              },
              builder: (context, mode) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: (height - 40) / 2),
                  child: Center(
                    child: [RefreshStatus.refreshing, RefreshStatus.completed]
                            .contains(mode)
                        ? CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary01,
                            backgroundColor: AppColors.black.withOpacity(0.07),
                          )
                        : CircularProgressIndicator(
                            value: animationRefresh.value,
                            strokeWidth: 2,
                            color: AppColors.primary01,
                            backgroundColor: AppColors.black.withOpacity(0.07),
                          ),
                  ),
                );
              },
            )
          : null,
      footer: CustomFooter(
        onOffsetChange: (offset) {
          animationLoadController.value = (offset / height);
        },
        height: widget.enableLoadmore == true ? height : 0,
        loadStyle:
            Platform.isIOS ? LoadStyle.ShowWhenLoading : LoadStyle.HideAlways,
        builder: (context, mode) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: (height - 40) / 2),
            child: Center(
              child: AnimatedBuilder(
                animation: animationLoad,
                builder: (context, child) {
                  return [LoadStatus.loading].contains(mode)
                      ? CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primary01,
                          backgroundColor: AppColors.black.withOpacity(0.07),
                        )
                      : CircularProgressIndicator(
                          value: animationLoad.value,
                          strokeWidth: 2,
                          color: AppColors.primary01,
                          backgroundColor: AppColors.black.withOpacity(0.07),
                        );
                },
              ),
            ),
          );
        },
      ),
      child: widget.child,
    );
    return child;
  }

  @override
  void dispose() {
    refreshController.dispose();
    animationRefreshController.dispose();
    super.dispose();
  }
}
