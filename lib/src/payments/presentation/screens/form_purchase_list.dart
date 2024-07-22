import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
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

class FormPurchaseList extends StatefulWidget {
  const FormPurchaseList({super.key});

  @override
  State<FormPurchaseList> createState() => _FormPurchaseListState();
}

class _FormPurchaseListState extends State<FormPurchaseList> {
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
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        LocaleKeys.payment_list_item.tr(),
                        style: AppStyles.text12.preReg,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        LocaleKeys.payment_list_use.tr(),
                        style: AppStyles.text12.preReg,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const AppDivider(
                  color: AppColors.dividerColor,
                ),
                BlocBuilder<PaymentBloc, PaymentState>(
                  buildWhen: (previous, current) =>
                      previous.listPurchase != current.listPurchase,
                  builder: (context, state) {
                    var purchases = state.listPurchase;
                    if (purchases == null) {
                      return const AppCircularLoading();
                    }
                    if (purchases.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppSize.paddingWithScreen),
                        child: Text(
                          LocaleKeys.payment_list_empty.tr(),
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
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: AppSize.paddingWithScreen,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 70.r,
                                    child: Text(
                                      purchases[index].createdAt,
                                      style: AppStyles.text12.preReg,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 140.r,
                                    child: Text(
                                      purchases[index].title,
                                      style: AppStyles.text12.preReg,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70.r,
                                    child: Text(
                                      purchases[index].price,
                                      style: AppStyles.text12.preReg,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const AppDivider(
                              color: AppColors.dividerColor,
                            );
                          },
                          itemCount: purchases.length,
                        ),
                        const AppDivider(
                          color: AppColors.dividerColor,
                        ),
                        SizedBox(
                          height: 14.r,
                        ),
                        WAppPaging(
                          pageCount: state.totalPurchasePage,
                          onSelectPage: (value) {
                            var bloc = context.read<PaymentBloc>();
                            bloc.loadPurchaseList(value);
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
              android: AppAdUnitId.myCoinTab3Android,
              iOS: AppAdUnitId.myCoinTab3iOS),
        ),
      ],
    );
  }
}
