import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app_base/config/app_config.dart';

class ResetTimer {
  ResetTimer._internal();

  static final ResetTimer instance = ResetTimer._internal();
  int _seconds = 30;
  int initialTimer = 0;
  final _streamController = StreamController<int>.broadcast();
  Timer? _timer;

  // Getters
  Stream<int> get stream => _streamController.stream;
  int get eslapseTime => _seconds;
  set counter(int counter) {
    _seconds = counter;
  }

  // Setters
  void start() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (event) {
      if (_seconds > 0) {
        _seconds--;
      } else {
        _timer!.cancel();
      }

      _streamController.add(_seconds);
    });
  }

  void cancel() {
    if (_timer != null) _timer?.cancel();
  }

  Widget showTimer({required BuildContext context}) {
    return StreamBuilder<int>(
        stream: stream,
        builder: (context, data) {
          int seconds = data.data ?? 0;
          int hours = seconds ~/ 3600;
          int minutes = (seconds % 3600) ~/ 60;
          if (seconds == 0) {
            return Text('$seconds시간',
                style: AppStyles.text14.preMed
                    .copyWith(color: AppColors.timerColor));
          }
          if (hours == 0) {
            return Text('$minutes초 ${seconds % 60}초',
                style: AppStyles.text14.preMed
                    .copyWith(color: AppColors.timerColor));
          }
          return Text('$hours시 $minutes초',
              style: AppStyles.text14.preMed
                  .copyWith(color: AppColors.timerColor));
        });
  }
}
