import 'package:borra_app/app_base/services/rest_api/rest_api.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/loading/app_loading.dart';
import 'page_stateful_actions.dart';

abstract class PageStateful<T extends StatefulWidget, B extends BlocBase>
    extends State<T>
    with WidgetsBindingObserver, ApiError
    implements PageStatefulAction<B> {
  late final B bloc;
  late final NavigatorState navigator;

  bool _initialized = false;

  @override
  @mustCallSuper
  void afterFirstBuild(BuildContext context) {}

  @override
  @mustCallSuper
  void initDependencies(BuildContext context) {
    bloc = context.read<B>();
    navigator = Navigator.of(context);
  }

  @override
  @mustCallSuper
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        afterFirstBuild(context);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized == false) {
      initDependencies(context);
      _initialized = true;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void showLoading(BuildContext context, bool show) {
    if (mounted) {
      if (show) {
        AppLoading.show(context);
      } else {
        AppLoading.dismiss(context);
      }
    }
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    return buildPage(context, bloc);
  }
}
