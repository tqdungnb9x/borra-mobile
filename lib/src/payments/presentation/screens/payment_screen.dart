import 'package:borra_app/app_base/extensions/extension.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/w_app_divider.dart';
import 'package:borra_app/src/authentication/auth/business_logic/blocs/authentication_bloc.dart';
import 'package:borra_app/src/payments/business_logic/payment_bloc.dart';
import 'package:borra_app/src/payments/presentation/screens/form_payment.dart';
import 'package:borra_app/src/payments/presentation/screens/form_payment_list.dart';
import 'package:borra_app/src/payments/presentation/screens/form_purchase_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app_base/config/app_config.dart';
import 'free_coin_ad.dart';

class PaymentScreen extends StatefulWidget {
  final int? selectedIndex;
  const PaymentScreen({super.key, this.selectedIndex = 0});

  @override
  State<PaymentScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends PageStateful<PaymentScreen, PaymentBloc>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
        initialIndex: widget.selectedIndex!, length: 4, vsync: this);
    super.initState();
  }

  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    bloc.initial();
    bloc.changeTabIndex(widget.selectedIndex!);
  }

  @override
  void dispose() {
    bloc.changeTabIndex(-1);
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context, PaymentBloc bloc) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppHeader(
            context,
            titleText: LocaleKeys.payment_list_payment_title.tr(),
          ),
          body: BlocListener<PaymentBloc, PaymentState>(
            listener: (context, state) {
              state.status.whenOrNull(
                idle: () {
                  showLoading(context, false);
                },
                loading: () {
                  showLoading(context, true);
                },
                success: (data) {
                  showLoading(context, false);
                },
                failure: (error) async {
                  showLoading(context, false);
                },
              );
            },
            listenWhen: ((previous, current) =>
                previous.status != current.status),
            child: BlocListener<PaymentBloc, PaymentState>(
              listener: (context, state) {
                state.statusBuy.whenOrNull(
                  idle: () {
                    showLoading(context, false);
                  },
                  loading: () {
                    showLoading(context, true);
                  },
                  success: (data) {
                    showLoading(context, false);
                  },
                  failure: (error) async {
                    showLoading(context, false);
                    UiUtils.showInfoSnackBar(context, message: error);
                  },
                );
              },
              listenWhen: ((previous, current) =>
                  previous.statusBuy != current.statusBuy),
              child: BlocListener<PaymentBloc, PaymentState>(
                listener: (context, state) {
                  state.statusUpdateCoin.whenOrNull(
                    success: (data) {
                      MainBloc.authBloc.updateUserInfo();
                    },
                  );
                },
                listenWhen: ((previous, current) =>
                    previous.statusUpdateCoin != current.statusUpdateCoin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildUserCoin(),
                    _buildTabBar(),
                    const AppDivider(
                      color: AppColors.dividerColor,
                    ),
                    AppSize.space32.verticalSpace,
                    Expanded(
                      child: BlocSelector<PaymentBloc, PaymentState, int>(
                          selector: (state) => state.tabIndex,
                          builder: (context, tabindex) {
                            if (tabindex ==
                                PaymentTabType.paymentHistory.index) {
                              return const FormPaymentList();
                            }
                            if (tabindex == PaymentTabType.purchase.index) {
                              return const FormPurchaseList();
                            }
                            if (tabindex == PaymentTabType.freeCoin.index) {
                              return const FeeCoinAd();
                            }
                            return const PaymentForm();
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: tabController,
      indicatorColor: AppColors.primary01,
      isScrollable: true,
      tabs: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.r),
          child: Text(
            LocaleKeys.payment_list_payment_title.tr(),
            style: AppStyles.text15.preMed,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.r),
          child: Text(
            LocaleKeys.payment_list_recharge_history.tr(),
            style: AppStyles.text15.preMed,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.r),
          child: Text(
            LocaleKeys.payment_list_usage_history.tr(),
            style: AppStyles.text15.preMed,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.r),
          child: Text(
            LocaleKeys.payment_list_free_coin.tr(),
            style: AppStyles.text15.preMed,
          ),
        ),
      ],
      onTap: (value) {
        bloc.changeTabIndex(value);
      },
    );
  }

  Widget _buildUserCoin() {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Container(
          height: 64.r,
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: AppSize.paddingWithScreen),
          decoration: BoxDecoration(
              color: AppColors.primary01,
              borderRadius: BorderRadius.circular(AppSize.extraMediumRadius)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.payment_list_current_balance.tr(),
                style: AppStyles.text14.preMed.copyWith(color: AppColors.white),
              ),
              SvgPicture.asset(AppImages.icCurrency),
              Text(
                ' ${state.user!.coin.borraCoin}',
                style: AppStyles.text14.preMed
                    .copyWith(color: const Color(0xFFFFE055)),
              ),
              Text(
                LocaleKeys.payment_list_current_balance_tail.tr(),
                style: AppStyles.text14.preMed.copyWith(color: AppColors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}

enum PaymentTabType { payment, paymentHistory, purchase, freeCoin }
