import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../env/env.dart';

part 'app_colors.dart';
part 'app_images.dart';
part 'app_languages.dart';

part 'app_size.dart';
part 'app_styles.dart';
part 'app_theme.dart';
part 'app_values.dart';

class AppConfig {
  AppConfig._internal();
  static final AppConfig instance = AppConfig._internal();

  Env env = Env.dev();

  factory AppConfig({required Env env}) {
    instance.env = env;
    return instance;
  }
}
