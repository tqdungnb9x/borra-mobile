import 'package:borra_app/app_base/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dashboard_bottom_navigation_bar_item.dart';

class DashBoardBottomNavigatorBar extends StatefulWidget {
  final List<DashboardBottomNavigationBarItem> items;
  final double? evaluate;
  final int currentIndex;
  final Function(int index)? onTap;
  DashBoardBottomNavigatorBar(
      {Key? key,
      required this.items,
      this.evaluate,
      this.currentIndex = 0,
      this.onTap})
      : assert(items.length >= 2),
        assert(items.every((item) => item.label != null),
            'Every item must have a non-null label'),
        assert(currentIndex >= 0),
        super(key: key);

  @override
  State<DashBoardBottomNavigatorBar> createState() =>
      _DashBoardBottomNavigatorBarState();
}

class _DashBoardBottomNavigatorBarState
    extends State<DashBoardBottomNavigatorBar> with TickerProviderStateMixin {
  List<AnimationController> _controllers = <AnimationController>[];
  late List<CurvedAnimation> _animations;

  void _rebuild() {
    setState(() {
      // Rebuilding when any of the controllers tick, i.e. when the items are
      // animated.
    });
  }

  void _resetState() {
    for (final AnimationController controller in _controllers) {
      controller.dispose();
    }
    _controllers =
        List<AnimationController>.generate(widget.items.length, (int index) {
      return AnimationController(
        duration: kThemeAnimationDuration,
        vsync: this,
      )..addListener(_rebuild);
    });
    _animations =
        List<CurvedAnimation>.generate(widget.items.length, (int index) {
      return CurvedAnimation(
        parent: _controllers[index],
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.fastOutSlowIn.flipped,
      );
    });
    _controllers[widget.currentIndex].value = 1.0;
  }

  @override
  void initState() {
    super.initState();
    _resetState();
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme =
        BottomNavigationBarTheme.of(context);
    final double additionalBottomPadding =
        MediaQuery.of(context).padding.bottom;
    final tiles = <_DashboardBottomNavigationTile>[];
    for (var i = 0; i < widget.items.length; i++) {
      tiles.add(_DashboardBottomNavigationTile(
        item: widget.items[i],
        onTap: () {
          widget.onTap?.call(i);
        },
        selected: i == widget.currentIndex,
        animation: _animations[i],
      ));
    }
    return Material(
      elevation: widget.evaluate ?? bottomTheme.elevation ?? 8.0,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.backgroundNavBar,
            border: Border(
                top: BorderSide(
                    color: AppColors.borderNavBar.withOpacity(.36)))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight:
                      kBottomNavigationBarHeight + additionalBottomPadding),
              child: Padding(
                padding: EdgeInsets.only(
                    top: AppSize.spaceBetweenWidgetExtraSmall,
                    bottom: additionalBottomPadding,
                    left: 16.w,
                    right: 16.w),
                child: MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: DefaultTextStyle.merge(
                    overflow: TextOverflow.ellipsis,
                    child: Material(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: tiles,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant DashBoardBottomNavigatorBar oldWidget) {
    // No animated segue if the length of the items list changes.
    if (widget.items.length != oldWidget.items.length) {
      _resetState();
      return;
    }

    if (widget.currentIndex != oldWidget.currentIndex) {
      _controllers[oldWidget.currentIndex].reverse();
      _controllers[widget.currentIndex].forward();
    }
    super.didUpdateWidget(oldWidget);
  }
}

class _DashboardBottomNavigationTile extends StatelessWidget {
  final VoidCallback? onTap;
  final DashboardBottomNavigationBarItem? item;
  final bool selected;
  final Animation<double> animation;
  const _DashboardBottomNavigationTile(
      {Key? key,
      this.onTap,
      this.item,
      this.selected = false,
      required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? effectiveTooltip =
        item?.tooltip == '' ? null : item?.tooltip ?? item?.label;
    Widget result = InkResponse(
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        onTap?.call();
      },
      child: Align(
        alignment: Alignment.center,
        child: Column(children: [
          if (selected) item!.activeIcon,
          if (!selected) item!.disabledIcon ?? item!.activeIcon,
          AppSize.spaceSmall.verticalSpace,
          if (item!.label != null)
            Text(item!.label!,
                style: AppStyles.text9.preReg.copyWith(
                    color: selected
                        ? item?.labelActiveColor ?? AppColors.primary01
                        : item?.labelColor ?? AppColors.black.withOpacity(.3)))
        ]),
      ),
    );
    if (effectiveTooltip != null) {
      result = Tooltip(
        message: effectiveTooltip,
        preferBelow: false,
        verticalOffset: 24,
        excludeFromSemantics: true,
        child: result,
      );
    }

    result = Semantics(
      selected: selected,
      container: true,
      child: Stack(
        children: <Widget>[
          result,
        ],
      ),
    );

    return Expanded(
      child: result,
    );
  }
}
