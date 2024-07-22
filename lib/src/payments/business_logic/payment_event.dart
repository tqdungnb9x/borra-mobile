part of 'payment_bloc.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.initial() = _Initial;
  const factory PaymentEvent.loadPaymentList(int page) = _LoadPaymentList;
  const factory PaymentEvent.loadPurchaseList(int page) = _LoadPurchaseList;
  const factory PaymentEvent.changeTab(int index) = _ChangeTabIndex;
  const factory PaymentEvent.loadMore() = _LoadMore;
  const factory PaymentEvent.purchasesLoaded() = _PurchasesLoaded;
  const factory PaymentEvent.purchaseBought(PaymentProduct product) =
      _PurchaseBought;
  const factory PaymentEvent.statusBuyChanged(Status status,
      {PurchaseDetails? purchaseDetails}) = _StatusBuyChanged;
  const factory PaymentEvent.updateUserCoin({
    required int productId,
    required String purchaseId,
    required String appProductId,
    required String paymentToken,
    String? failedReason,
  }) = _UpdateUserCoin;
}
