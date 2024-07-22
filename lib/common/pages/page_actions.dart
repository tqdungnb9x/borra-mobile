import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PageActions<T extends BlocBase> {
  /// Will be called right before build method is executed
  void initDependencies(BuildContext context);

  /// In Stateful pages, it will be executed after initState

  void showLoading(BuildContext context, bool show);

  Widget buildPage(BuildContext context, T bloc);
}
