
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'page_actions.dart';

abstract class PageStatefulAction<T extends BlocBase> extends PageActions<T> {
  /// This function will be called after the first build
  void afterFirstBuild(BuildContext context);
}
