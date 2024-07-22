import 'dart:io';

import 'package:borra_app/app_base/extensions/extension.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/config/app_routes.dart';
import '../../../../app_base/constants/ad_unit_id.dart';
import '../../../../app_base/models/ad_unit_id_model.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../../common/admob/banner_ad.dart';
import '../../../home/presentation/widgets/w_section_header.dart';
import '../../business_logic/payment_bloc.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  int selectedProduct = -1;
  int selectedMethod = -1;
  bool? isAgree = false;
  bool allowNext = false;
  bool _isLoading = false;
  validate() {
    if (selectedProduct != -1 && (isAgree != null && isAgree == true)) {
      allowNext = true;
    } else {
      allowNext = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) {
        state.statusBuy.whenOrNull(
          success: (data) {
            _isLoading = false;
          },
          failure: (error) async {
            _isLoading = false;
          },
        );
      },
      listenWhen: ((previous, current) =>
          previous.statusBuy != current.statusBuy),
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          state.statusUpdateCoin.whenOrNull(
            success: (data) {
              _isLoading = false;
              selectedProduct = -1;
              selectedMethod = -1;
              isAgree = false;
              validate();
            },
            failure: (error) {
              _isLoading = false;
            },
          );
        },
        listenWhen: ((previous, current) =>
            previous.statusUpdateCoin != current.statusUpdateCoin),
        child: Column(
          children: [
            WSectionHeader(headerTitle: LocaleKeys.payment_list_charging.tr()),
            AppSize.space22.verticalSpace,
            Expanded(
                child: BlocBuilder<PaymentBloc, PaymentState>(
              buildWhen: (previous, current) =>
                  previous.appPayment != current.appPayment,
              builder: (context, state) {
                if (state.appPayment == null) {
                  return const SizedBox.shrink();
                }
                var products = state.appPayment?.paymentProduct;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  selectedProduct = index;
                                  validate();
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSize.spaceBetweenWidgetLarge,
                                    vertical:
                                        AppSize.spaceBetweenWidgetExtraSmall),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            AppColors.black.withOpacity(0.08)),
                                    borderRadius: BorderRadius.circular(100.r)),
                                child: Row(
                                  children: [
                                    selectedProduct == index
                                        ? SvgPicture.asset(
                                            AppImages.icRadioChecked,
                                            width: 16.r,
                                            height: 16.r,
                                          )
                                        : SvgPicture.asset(
                                            AppImages.icRadioNone,
                                            width: 16.r,
                                            height: 16.r,
                                          ),
                                    AppSize.spaceBetweenWidgetMedium
                                        .horizontalSpace,
                                    Text(
                                      Platform.isIOS
                                          ? ' ${products![index].priceIos.toString().withSymbols()}'
                                          : ' ${products![index].priceAos.toString().withSymbols()}',
                                      style: AppStyles.text14.preReg,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: AppSize.iconSize,
                                      color: AppColors.primary01,
                                    ),
                                    Text(
                                      ' ${products[index].content}',
                                      style: AppStyles.text14.preReg
                                          .copyWith(color: AppColors.primary01),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, __) =>
                              AppSize.spaceLarge.verticalSpace,
                          itemCount: state.appPayment!.paymentProduct.length,
                        ),
                        AppSize.space15.verticalSpace,
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Checkbox(
                                activeColor: AppColors.primary01,
                                value: isAgree,
                                onChanged: (value) {
                                  setState(() {
                                    isAgree = value;
                                    validate();
                                  });
                                },
                              ),
                              Text(
                                LocaleKeys.payment_list_consent_desc.tr(),
                                style: AppStyles.text14.preReg
                                    .copyWith(color: const Color(0xFF787878)),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, AppRoutesMain.collectInfoPolicy),
                                child: Text(
                                  LocaleKeys.button_details.tr(),
                                  style: AppStyles.text14.preReg.copyWith(
                                      color: const Color(0xFF787878),
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          ),
                        ),
                        AppSize.space22.verticalSpace,
                      ]),
                    )),
                    AppSize.space10.verticalSpace,
                    AppButton(
                      text: LocaleKeys.payment_list_charging.tr(),
                      type: allowNext ? ButtonType.fill : ButtonType.disabled,
                      onClicked: allowNext
                          ? () {
                              if (!_isLoading) {
                                _isLoading = true;
                                context
                                    .read<PaymentBloc>()
                                    .buy(products![selectedProduct]);
                              }
                            }
                          : null,
                    ),
                    AppSize.space10.verticalSpace,
                    BannerAdmob(
                      size: AdSize.largeBanner,
                      adUnitId: AdUnitId(
                          android: AppAdUnitId.myCoinTab1Android,
                          iOS: AppAdUnitId.myCoinTab1iOS),
                    ),
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
