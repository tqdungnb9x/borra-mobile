import 'dart:ui';

import 'package:borra_app/src/authentication/auth/business_logic/blocs/authentication_bloc.dart';
import 'package:borra_app/src/splash/business_logic/blocs/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../src/payments/business_logic/payment_bloc.dart';

class MainBloc {
  static final authBloc = AuthenticationBloc();
  static final appBloc = AppBloc();
  static final paymentBloc = PaymentBloc();
  static final List<BlocProvider> providers = [
    BlocProvider<AuthenticationBloc>.value(value: authBloc),
    BlocProvider<AppBloc>.value(value: appBloc),
    BlocProvider<PaymentBloc>.value(value: paymentBloc),
  ];
  static VoidCallback? unauthorizedCallback;
  static dispose() {
    authBloc.close();
  }
}
