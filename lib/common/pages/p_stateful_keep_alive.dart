import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'p_stateful.dart';

abstract class PageStatefulKeepAlive<T extends StatefulWidget,
        B extends BlocBase> extends PageStateful<T, B>
    with AutomaticKeepAliveClientMixin {
  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);
    return buildPage(context, bloc);
  }

  @override
  bool get wantKeepAlive => true;
}
