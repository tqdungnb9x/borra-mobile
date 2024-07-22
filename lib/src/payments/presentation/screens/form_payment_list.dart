import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/models/status.dart';
import 'package:borra_app/common/widgets/loading/app_loading.dart';
import 'package:borra_app/common/widgets/w_app_divider.dart';
import 'package:borra_app/common/admob/banner_ad.dart';
import 'package:borra_app/src/payments/business_logic/payment_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../app_base/constants/ad_unit_id.dart';
import '../../../../app_base/models/ad_unit_id_model.dart';
import '../widgets/w_paging.dart';

class FormPaymentList extends StatefulWidget {
  const FormPaymentList({super.key});

  @override
  State<FormPaymentList> createState() => _FormPaymentListState();
}

class _FormPaymentListState extends State<FormPaymentList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppDivider(
                  color: AppColors.dividerColor,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppSize.paddingWithScreen,
                      horizontal: AppSize.space32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.payment_list_date.tr(),
                        style: AppStyles.text12.preReg,
                      ),
                      Text(
                        LocaleKeys.payment_list_classification.tr(),
                        style: AppStyles.text12.preReg,
                      ),
                      Text(
                        LocaleKeys.payment_list_charge.tr(),
                        style: AppStyles.text12.preReg,
                      ),
                      Text(
                        LocaleKeys.payment_list_payment.tr(),
                        style: AppStyles.text12.preReg,
                      )
                    ],
                  ),
                ),
                const AppDivider(
                  color: AppColors.dividerColor,
                ),
                BlocBuilder<PaymentBloc, PaymentState>(
                  buildWhen: (previous, current) =>
                      previous.listPayment != current.listPayment,
                  builder: (context, state) {
                    var payments = state.listPayment;
                    if (payments == null ||
                        state.statusLoadPaymentList == const Status.loading()) {
                      return const AppCircularLoading();
                    }
                    if (payments.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppSize.paddingWithScreen),
                        child: Text(
                          LocaleKeys.payment_list_title.tr(),
                          style: AppStyles.text12.preReg,
                        ),
                      );
                    }
                    return Column(
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            clipBehavior: Clip.none,
                            itemBuilder: (context, index) {
                              if (payments[index] == null) {
                                return const SizedBox.shrink();
                              }
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppSize.paddingWithScreen,
                                  // horizontal: AppSize.space32,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 70.r,
                                      child: Text(
                                        payments[index]!.createdAt,
                                        style: AppStyles.text12.preReg,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70.r,
                                      child: Text(
                                        payments[index]!.method,
                                        style: AppStyles.text12.preReg,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70.r,
                                      child: Text(
                                        payments[index]!.title,
                                        style: AppStyles.text12.preReg,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70.r,
                                      child: Text(
                                        payments[index]!.price.toString(),
                                        style: AppStyles.text12.preReg,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              if (payments[index] == null) {
                                return const SizedBox.shrink();
                              }
                              return const AppDivider(
                                color: AppColors.dividerColor,
                              );
                            },
                            itemCount: payments.length),
                        const AppDivider(
                          color: AppColors.dividerColor,
                        ),
                        SizedBox(
                          height: 14.r,
                        ),
                        WAppPaging(
                          pageCount: state.totalPaymentPage,
                          onSelectPage: (value) {
                            var bloc = context.read<PaymentBloc>();
                            bloc.loadPaymentList(value);
                          },
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        BannerAdmob(
          size: AdSize.largeBanner,
          adUnitId: AdUnitId(
              android: AppAdUnitId.myCoinTab2Android,
              iOS: AppAdUnitId.myCoinTab2iOS),
        ),
      ],
    );
  }
}
