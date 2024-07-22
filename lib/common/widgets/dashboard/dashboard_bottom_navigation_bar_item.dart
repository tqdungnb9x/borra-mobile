import 'package:flutter/material.dart';

class DashboardBottomNavigationBarItem {
  final Widget activeIcon;
  final Widget? disabledIcon;
  final Color? labelActiveColor;
  final Color? labelColor;
  final String? label;
  final String? tooltip;

  DashboardBottomNavigationBarItem({
    required this.activeIcon,
    Widget? disabledIcon,
    this.label,
    this.tooltip,
    this.labelActiveColor,
    this.labelColor,
  }) : disabledIcon = disabledIcon ?? activeIcon;
}
