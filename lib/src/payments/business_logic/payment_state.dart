part of 'payment_bloc.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status statusLoadPaymentList,
    @Default(Status.idle()) Status statusLoadPurchaseList,
    @Default(Status.idle()) Status statusLoadMore,
    @Default(Status.idle()) Status statusBuy,
    @Default(Status.idle()) Status statusUpdateCoin,
    List<PaymentProduct>? listPaymentProduct,
    List<PaymentMethod>? listPaymentMethod,
    List<PaymentItem?>? listPayment,
    @Default(1) int totalPurchasePage,
    @Default(1) int totalPaymentPage,
    List<PurchaseItem>? listPurchase,
    AppPayment? appPayment,
    @Default(0) int tabIndex,
    @Default(1) int page,
    @Default(6) int pageSize,
    PurchaseDetails? successPurchaseInfo,
    PaymentProduct? selectedProduct,
    PurchasableProduct? purchaseTryProduct,
    @Default(StoreState.idle) StoreState storeState,
    @Default(<PurchasableProduct>[]) List<PurchasableProduct> products,
  }) = _PaymentState;
  factory PaymentState.initial() => const PaymentState();
}
