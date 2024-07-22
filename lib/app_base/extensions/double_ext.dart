part of 'extension.dart';

extension DoubleExt on double {
  String get money {
    return NumberFormat.decimalPattern('ko').format(this);
  }

  String get borraCoin {
    return NumberFormat.decimalPattern('ko').format(this / 100);
  }
}

extension IntExt on int {
  bool get toBool {
    return this == 1 ? true : false;
  }
}

extension BoolExt on bool {
  int get toInt {
    return this ? 1 : 0;
  }
}
