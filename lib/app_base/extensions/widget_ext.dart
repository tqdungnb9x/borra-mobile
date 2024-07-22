part of 'extension.dart';

extension WidgetExt on Widget {
  SliverToBoxAdapter toSliver() {
    return SliverToBoxAdapter(
      child: this,
    );
  }
}
