import 'package:borra_app/common/widgets/loading/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_base/services/rest_api/rest_api.dart';
import 'page_actions.dart';

abstract class PageStateless<T extends BlocBase> extends StatelessWidget
    with ApiError
    implements PageActions<T> {
  const PageStateless({Key? key}) : super(key: key);

  @override
  void showLoading(BuildContext context, bool show) {
    if (show) {
      AppLoading.show(context);
    } else {
      AppLoading.dismiss(context);
    }
  }

  @override
  @mustCallSuper
  void initDependencies(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    initDependencies(context);
    final T bloc = context.read<T>();
    return buildPage(context, bloc);
  }
}
