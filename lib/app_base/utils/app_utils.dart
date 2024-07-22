import 'dart:io';
import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:borra_app/app_base/extensions/extension.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../../common/main_bloc.dart';
import '../../src/authentication/auth/data/models/auth_status.dart';
import '../../src/authentication/sign_in/business_logic/blocs/sign_in_bloc.dart';
import '../../src/authentication/sign_in/presentation/screens/sign_in_screen.dart';
import '../config/app_config.dart';
import '../generated/locale_keys.g.dart';
import '../models/device_model.dart';

part 'color_utils.dart';
part 'device_utils.dart';
part 'file_utils.dart';
part 'keyboard_utils.dart';
part 'language_utils.dart';
part 'logger_utils.dart';
part 'other_utils.dart';
part 'routes_utils.dart';
part 'scroll_behavior_utils.dart';
part 'string_utils.dart';
part 'timezone_util.dart';
part 'ui_utils.dart';
part 'validate_utils.dart';
