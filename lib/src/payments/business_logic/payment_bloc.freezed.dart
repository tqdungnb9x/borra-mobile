// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentState {
  Status get status => throw _privateConstructorUsedError;
  Status get statusLoadPaymentList => throw _privateConstructorUsedError;
  Status get statusLoadPurchaseList => throw _privateConstructorUsedError;
  Status get statusLoadMore => throw _privateConstructorUsedError;
  Status get statusBuy => throw _privateConstructorUsedError;
  Status get statusUpdateCoin => throw _privateConstructorUsedError;
  List<PaymentProduct>? get listPaymentProduct =>
      throw _privateConstructorUsedError;
  List<PaymentMethod>? get listPaymentMethod =>
      throw _privateConstructorUsedError;
  List<PaymentItem?>? get listPayment => throw _privateConstructorUsedError;
  int get totalPurchasePage => throw _privateConstructorUsedError;
  int get totalPaymentPage => throw _privateConstructorUsedError;
  List<PurchaseItem>? get listPurchase => throw _privateConstructorUsedError;
  AppPayment? get appPayment => throw _privateConstructorUsedError;
  int get tabIndex => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  PurchaseDetails? get successPurchaseInfo =>
      throw _privateConstructorUsedError;
  PaymentProduct? get selectedProduct => throw _privateConstructorUsedError;
  PurchasableProduct? get purchaseTryProduct =>
      throw _privateConstructorUsedError;
  StoreState get storeState => throw _privateConstructorUsedError;
  List<PurchasableProduct> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentStateCopyWith<PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
  @useResult
  $Res call(
      {Status status,
      Status statusLoadPaymentList,
      Status statusLoadPurchaseList,
      Status statusLoadMore,
      Status statusBuy,
      Status statusUpdateCoin,
      List<PaymentProduct>? listPaymentProduct,
      List<PaymentMethod>? listPaymentMethod,
      List<PaymentItem?>? listPayment,
      int totalPurchasePage,
      int totalPaymentPage,
      List<PurchaseItem>? listPurchase,
      AppPayment? appPayment,
      int tabIndex,
      int page,
      int pageSize,
      PurchaseDetails? successPurchaseInfo,
      PaymentProduct? selectedProduct,
      PurchasableProduct? purchaseTryProduct,
      StoreState storeState,
      List<PurchasableProduct> products});

  $StatusCopyWith<$Res> get status;
  $StatusCopyWith<$Res> get statusLoadPaymentList;
  $StatusCopyWith<$Res> get statusLoadPurchaseList;
  $StatusCopyWith<$Res> get statusLoadMore;
  $StatusCopyWith<$Res> get statusBuy;
  $StatusCopyWith<$Res> get statusUpdateCoin;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusLoadPaymentList = null,
    Object? statusLoadPurchaseList = null,
    Object? statusLoadMore = null,
    Object? statusBuy = null,
    Object? statusUpdateCoin = null,
    Object? listPaymentProduct = freezed,
    Object? listPaymentMethod = freezed,
    Object? listPayment = freezed,
    Object? totalPurchasePage = null,
    Object? totalPaymentPage = null,
    Object? listPurchase = freezed,
    Object? appPayment = freezed,
    Object? tabIndex = null,
    Object? page = null,
    Object? pageSize = null,
    Object? successPurchaseInfo = freezed,
    Object? selectedProduct = freezed,
    Object? purchaseTryProduct = freezed,
    Object? storeState = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadPaymentList: null == statusLoadPaymentList
          ? _value.statusLoadPaymentList
          : statusLoadPaymentList // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadPurchaseList: null == statusLoadPurchaseList
          ? _value.statusLoadPurchaseList
          : statusLoadPurchaseList // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadMore: null == statusLoadMore
          ? _value.statusLoadMore
          : statusLoadMore // ignore: cast_nullable_to_non_nullable
              as Status,
      statusBuy: null == statusBuy
          ? _value.statusBuy
          : statusBuy // ignore: cast_nullable_to_non_nullable
              as Status,
      statusUpdateCoin: null == statusUpdateCoin
          ? _value.statusUpdateCoin
          : statusUpdateCoin // ignore: cast_nullable_to_non_nullable
              as Status,
      listPaymentProduct: freezed == listPaymentProduct
          ? _value.listPaymentProduct
          : listPaymentProduct // ignore: cast_nullable_to_non_nullable
              as List<PaymentProduct>?,
      listPaymentMethod: freezed == listPaymentMethod
          ? _value.listPaymentMethod
          : listPaymentMethod // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>?,
      listPayment: freezed == listPayment
          ? _value.listPayment
          : listPayment // ignore: cast_nullable_to_non_nullable
              as List<PaymentItem?>?,
      totalPurchasePage: null == totalPurchasePage
          ? _value.totalPurchasePage
          : totalPurchasePage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPaymentPage: null == totalPaymentPage
          ? _value.totalPaymentPage
          : totalPaymentPage // ignore: cast_nullable_to_non_nullable
              as int,
      listPurchase: freezed == listPurchase
          ? _value.listPurchase
          : listPurchase // ignore: cast_nullable_to_non_nullable
              as List<PurchaseItem>?,
      appPayment: freezed == appPayment
          ? _value.appPayment
          : appPayment // ignore: cast_nullable_to_non_nullable
              as AppPayment?,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      successPurchaseInfo: freezed == successPurchaseInfo
          ? _value.successPurchaseInfo
          : successPurchaseInfo // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails?,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as PaymentProduct?,
      purchaseTryProduct: freezed == purchaseTryProduct
          ? _value.purchaseTryProduct
          : purchaseTryProduct // ignore: cast_nullable_to_non_nullable
              as PurchasableProduct?,
      storeState: null == storeState
          ? _value.storeState
          : storeState // ignore: cast_nullable_to_non_nullable
              as StoreState,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<PurchasableProduct>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusLoadPaymentList {
    return $StatusCopyWith<$Res>(_value.statusLoadPaymentList, (value) {
      return _then(_value.copyWith(statusLoadPaymentList: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusLoadPurchaseList {
    return $StatusCopyWith<$Res>(_value.statusLoadPurchaseList, (value) {
      return _then(_value.copyWith(statusLoadPurchaseList: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusLoadMore {
    return $StatusCopyWith<$Res>(_value.statusLoadMore, (value) {
      return _then(_value.copyWith(statusLoadMore: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusBuy {
    return $StatusCopyWith<$Res>(_value.statusBuy, (value) {
      return _then(_value.copyWith(statusBuy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusUpdateCoin {
    return $StatusCopyWith<$Res>(_value.statusUpdateCoin, (value) {
      return _then(_value.copyWith(statusUpdateCoin: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentStateImplCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory _$$PaymentStateImplCopyWith(
          _$PaymentStateImpl value, $Res Function(_$PaymentStateImpl) then) =
      __$$PaymentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Status statusLoadPaymentList,
      Status statusLoadPurchaseList,
      Status statusLoadMore,
      Status statusBuy,
      Status statusUpdateCoin,
      List<PaymentProduct>? listPaymentProduct,
      List<PaymentMethod>? listPaymentMethod,
      List<PaymentItem?>? listPayment,
      int totalPurchasePage,
      int totalPaymentPage,
      List<PurchaseItem>? listPurchase,
      AppPayment? appPayment,
      int tabIndex,
      int page,
      int pageSize,
      PurchaseDetails? successPurchaseInfo,
      PaymentProduct? selectedProduct,
      PurchasableProduct? purchaseTryProduct,
      StoreState storeState,
      List<PurchasableProduct> products});

  @override
  $StatusCopyWith<$Res> get status;
  @override
  $StatusCopyWith<$Res> get statusLoadPaymentList;
  @override
  $StatusCopyWith<$Res> get statusLoadPurchaseList;
  @override
  $StatusCopyWith<$Res> get statusLoadMore;
  @override
  $StatusCopyWith<$Res> get statusBuy;
  @override
  $StatusCopyWith<$Res> get statusUpdateCoin;
}

/// @nodoc
class __$$PaymentStateImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentStateImpl>
    implements _$$PaymentStateImplCopyWith<$Res> {
  __$$PaymentStateImplCopyWithImpl(
      _$PaymentStateImpl _value, $Res Function(_$PaymentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusLoadPaymentList = null,
    Object? statusLoadPurchaseList = null,
    Object? statusLoadMore = null,
    Object? statusBuy = null,
    Object? statusUpdateCoin = null,
    Object? listPaymentProduct = freezed,
    Object? listPaymentMethod = freezed,
    Object? listPayment = freezed,
    Object? totalPurchasePage = null,
    Object? totalPaymentPage = null,
    Object? listPurchase = freezed,
    Object? appPayment = freezed,
    Object? tabIndex = null,
    Object? page = null,
    Object? pageSize = null,
    Object? successPurchaseInfo = freezed,
    Object? selectedProduct = freezed,
    Object? purchaseTryProduct = freezed,
    Object? storeState = null,
    Object? products = null,
  }) {
    return _then(_$PaymentStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadPaymentList: null == statusLoadPaymentList
          ? _value.statusLoadPaymentList
          : statusLoadPaymentList // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadPurchaseList: null == statusLoadPurchaseList
          ? _value.statusLoadPurchaseList
          : statusLoadPurchaseList // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadMore: null == statusLoadMore
          ? _value.statusLoadMore
          : statusLoadMore // ignore: cast_nullable_to_non_nullable
              as Status,
      statusBuy: null == statusBuy
          ? _value.statusBuy
          : statusBuy // ignore: cast_nullable_to_non_nullable
              as Status,
      statusUpdateCoin: null == statusUpdateCoin
          ? _value.statusUpdateCoin
          : statusUpdateCoin // ignore: cast_nullable_to_non_nullable
              as Status,
      listPaymentProduct: freezed == listPaymentProduct
          ? _value._listPaymentProduct
          : listPaymentProduct // ignore: cast_nullable_to_non_nullable
              as List<PaymentProduct>?,
      listPaymentMethod: freezed == listPaymentMethod
          ? _value._listPaymentMethod
          : listPaymentMethod // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>?,
      listPayment: freezed == listPayment
          ? _value._listPayment
          : listPayment // ignore: cast_nullable_to_non_nullable
              as List<PaymentItem?>?,
      totalPurchasePage: null == totalPurchasePage
          ? _value.totalPurchasePage
          : totalPurchasePage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPaymentPage: null == totalPaymentPage
          ? _value.totalPaymentPage
          : totalPaymentPage // ignore: cast_nullable_to_non_nullable
              as int,
      listPurchase: freezed == listPurchase
          ? _value._listPurchase
          : listPurchase // ignore: cast_nullable_to_non_nullable
              as List<PurchaseItem>?,
      appPayment: freezed == appPayment
          ? _value.appPayment
          : appPayment // ignore: cast_nullable_to_non_nullable
              as AppPayment?,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      successPurchaseInfo: freezed == successPurchaseInfo
          ? _value.successPurchaseInfo
          : successPurchaseInfo // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails?,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as PaymentProduct?,
      purchaseTryProduct: freezed == purchaseTryProduct
          ? _value.purchaseTryProduct
          : purchaseTryProduct // ignore: cast_nullable_to_non_nullable
              as PurchasableProduct?,
      storeState: null == storeState
          ? _value.storeState
          : storeState // ignore: cast_nullable_to_non_nullable
              as StoreState,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<PurchasableProduct>,
    ));
  }
}

/// @nodoc

class _$PaymentStateImpl implements _PaymentState {
  const _$PaymentStateImpl(
      {this.status = const Status.idle(),
      this.statusLoadPaymentList = const Status.idle(),
      this.statusLoadPurchaseList = const Status.idle(),
      this.statusLoadMore = const Status.idle(),
      this.statusBuy = const Status.idle(),
      this.statusUpdateCoin = const Status.idle(),
      final List<PaymentProduct>? listPaymentProduct,
      final List<PaymentMethod>? listPaymentMethod,
      final List<PaymentItem?>? listPayment,
      this.totalPurchasePage = 1,
      this.totalPaymentPage = 1,
      final List<PurchaseItem>? listPurchase,
      this.appPayment,
      this.tabIndex = 0,
      this.page = 1,
      this.pageSize = 6,
      this.successPurchaseInfo,
      this.selectedProduct,
      this.purchaseTryProduct,
      this.storeState = StoreState.idle,
      final List<PurchasableProduct> products = const <PurchasableProduct>[]})
      : _listPaymentProduct = listPaymentProduct,
        _listPaymentMethod = listPaymentMethod,
        _listPayment = listPayment,
        _listPurchase = listPurchase,
        _products = products;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Status statusLoadPaymentList;
  @override
  @JsonKey()
  final Status statusLoadPurchaseList;
  @override
  @JsonKey()
  final Status statusLoadMore;
  @override
  @JsonKey()
  final Status statusBuy;
  @override
  @JsonKey()
  final Status statusUpdateCoin;
  final List<PaymentProduct>? _listPaymentProduct;
  @override
  List<PaymentProduct>? get listPaymentProduct {
    final value = _listPaymentProduct;
    if (value == null) return null;
    if (_listPaymentProduct is EqualUnmodifiableListView)
      return _listPaymentProduct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PaymentMethod>? _listPaymentMethod;
  @override
  List<PaymentMethod>? get listPaymentMethod {
    final value = _listPaymentMethod;
    if (value == null) return null;
    if (_listPaymentMethod is EqualUnmodifiableListView)
      return _listPaymentMethod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PaymentItem?>? _listPayment;
  @override
  List<PaymentItem?>? get listPayment {
    final value = _listPayment;
    if (value == null) return null;
    if (_listPayment is EqualUnmodifiableListView) return _listPayment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int totalPurchasePage;
  @override
  @JsonKey()
  final int totalPaymentPage;
  final List<PurchaseItem>? _listPurchase;
  @override
  List<PurchaseItem>? get listPurchase {
    final value = _listPurchase;
    if (value == null) return null;
    if (_listPurchase is EqualUnmodifiableListView) return _listPurchase;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AppPayment? appPayment;
  @override
  @JsonKey()
  final int tabIndex;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;
  @override
  final PurchaseDetails? successPurchaseInfo;
  @override
  final PaymentProduct? selectedProduct;
  @override
  final PurchasableProduct? purchaseTryProduct;
  @override
  @JsonKey()
  final StoreState storeState;
  final List<PurchasableProduct> _products;
  @override
  @JsonKey()
  List<PurchasableProduct> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'PaymentState(status: $status, statusLoadPaymentList: $statusLoadPaymentList, statusLoadPurchaseList: $statusLoadPurchaseList, statusLoadMore: $statusLoadMore, statusBuy: $statusBuy, statusUpdateCoin: $statusUpdateCoin, listPaymentProduct: $listPaymentProduct, listPaymentMethod: $listPaymentMethod, listPayment: $listPayment, totalPurchasePage: $totalPurchasePage, totalPaymentPage: $totalPaymentPage, listPurchase: $listPurchase, appPayment: $appPayment, tabIndex: $tabIndex, page: $page, pageSize: $pageSize, successPurchaseInfo: $successPurchaseInfo, selectedProduct: $selectedProduct, purchaseTryProduct: $purchaseTryProduct, storeState: $storeState, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLoadPaymentList, statusLoadPaymentList) ||
                other.statusLoadPaymentList == statusLoadPaymentList) &&
            (identical(other.statusLoadPurchaseList, statusLoadPurchaseList) ||
                other.statusLoadPurchaseList == statusLoadPurchaseList) &&
            (identical(other.statusLoadMore, statusLoadMore) ||
                other.statusLoadMore == statusLoadMore) &&
            (identical(other.statusBuy, statusBuy) ||
                other.statusBuy == statusBuy) &&
            (identical(other.statusUpdateCoin, statusUpdateCoin) ||
                other.statusUpdateCoin == statusUpdateCoin) &&
            const DeepCollectionEquality()
                .equals(other._listPaymentProduct, _listPaymentProduct) &&
            const DeepCollectionEquality()
                .equals(other._listPaymentMethod, _listPaymentMethod) &&
            const DeepCollectionEquality()
                .equals(other._listPayment, _listPayment) &&
            (identical(other.totalPurchasePage, totalPurchasePage) ||
                other.totalPurchasePage == totalPurchasePage) &&
            (identical(other.totalPaymentPage, totalPaymentPage) ||
                other.totalPaymentPage == totalPaymentPage) &&
            const DeepCollectionEquality()
                .equals(other._listPurchase, _listPurchase) &&
            (identical(other.appPayment, appPayment) ||
                other.appPayment == appPayment) &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.successPurchaseInfo, successPurchaseInfo) ||
                other.successPurchaseInfo == successPurchaseInfo) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct) &&
            (identical(other.purchaseTryProduct, purchaseTryProduct) ||
                other.purchaseTryProduct == purchaseTryProduct) &&
            (identical(other.storeState, storeState) ||
                other.storeState == storeState) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        statusLoadPaymentList,
        statusLoadPurchaseList,
        statusLoadMore,
        statusBuy,
        statusUpdateCoin,
        const DeepCollectionEquality().hash(_listPaymentProduct),
        const DeepCollectionEquality().hash(_listPaymentMethod),
        const DeepCollectionEquality().hash(_listPayment),
        totalPurchasePage,
        totalPaymentPage,
        const DeepCollectionEquality().hash(_listPurchase),
        appPayment,
        tabIndex,
        page,
        pageSize,
        successPurchaseInfo,
        selectedProduct,
        purchaseTryProduct,
        storeState,
        const DeepCollectionEquality().hash(_products)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentStateImplCopyWith<_$PaymentStateImpl> get copyWith =>
      __$$PaymentStateImplCopyWithImpl<_$PaymentStateImpl>(this, _$identity);
}

abstract class _PaymentState implements PaymentState {
  const factory _PaymentState(
      {final Status status,
      final Status statusLoadPaymentList,
      final Status statusLoadPurchaseList,
      final Status statusLoadMore,
      final Status statusBuy,
      final Status statusUpdateCoin,
      final List<PaymentProduct>? listPaymentProduct,
      final List<PaymentMethod>? listPaymentMethod,
      final List<PaymentItem?>? listPayment,
      final int totalPurchasePage,
      final int totalPaymentPage,
      final List<PurchaseItem>? listPurchase,
      final AppPayment? appPayment,
      final int tabIndex,
      final int page,
      final int pageSize,
      final PurchaseDetails? successPurchaseInfo,
      final PaymentProduct? selectedProduct,
      final PurchasableProduct? purchaseTryProduct,
      final StoreState storeState,
      final List<PurchasableProduct> products}) = _$PaymentStateImpl;

  @override
  Status get status;
  @override
  Status get statusLoadPaymentList;
  @override
  Status get statusLoadPurchaseList;
  @override
  Status get statusLoadMore;
  @override
  Status get statusBuy;
  @override
  Status get statusUpdateCoin;
  @override
  List<PaymentProduct>? get listPaymentProduct;
  @override
  List<PaymentMethod>? get listPaymentMethod;
  @override
  List<PaymentItem?>? get listPayment;
  @override
  int get totalPurchasePage;
  @override
  int get totalPaymentPage;
  @override
  List<PurchaseItem>? get listPurchase;
  @override
  AppPayment? get appPayment;
  @override
  int get tabIndex;
  @override
  int get page;
  @override
  int get pageSize;
  @override
  PurchaseDetails? get successPurchaseInfo;
  @override
  PaymentProduct? get selectedProduct;
  @override
  PurchasableProduct? get purchaseTryProduct;
  @override
  StoreState get storeState;
  @override
  List<PurchasableProduct> get products;
  @override
  @JsonKey(ignore: true)
  _$$PaymentStateImplCopyWith<_$PaymentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int page) loadPaymentList,
    required TResult Function(int page) loadPurchaseList,
    required TResult Function(int index) changeTab,
    required TResult Function() loadMore,
    required TResult Function() purchasesLoaded,
    required TResult Function(PaymentProduct product) purchaseBought,
    required TResult Function(Status status, PurchaseDetails? purchaseDetails)
        statusBuyChanged,
    required TResult Function(int productId, String purchaseId,
            String appProductId, String paymentToken, String? failedReason)
        updateUserCoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int page)? loadPaymentList,
    TResult? Function(int page)? loadPurchaseList,
    TResult? Function(int index)? changeTab,
    TResult? Function()? loadMore,
    TResult? Function()? purchasesLoaded,
    TResult? Function(PaymentProduct product)? purchaseBought,
    TResult? Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult? Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int page)? loadPaymentList,
    TResult Function(int page)? loadPurchaseList,
    TResult Function(int index)? changeTab,
    TResult Function()? loadMore,
    TResult Function()? purchasesLoaded,
    TResult Function(PaymentProduct product)? purchaseBought,
    TResult Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadPaymentList value) loadPaymentList,
    required TResult Function(_LoadPurchaseList value) loadPurchaseList,
    required TResult Function(_ChangeTabIndex value) changeTab,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_PurchasesLoaded value) purchasesLoaded,
    required TResult Function(_PurchaseBought value) purchaseBought,
    required TResult Function(_StatusBuyChanged value) statusBuyChanged,
    required TResult Function(_UpdateUserCoin value) updateUserCoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadPaymentList value)? loadPaymentList,
    TResult? Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult? Function(_ChangeTabIndex value)? changeTab,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult? Function(_PurchaseBought value)? purchaseBought,
    TResult? Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult? Function(_UpdateUserCoin value)? updateUserCoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadPaymentList value)? loadPaymentList,
    TResult Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult Function(_ChangeTabIndex value)? changeTab,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult Function(_PurchaseBought value)? purchaseBought,
    TResult Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult Function(_UpdateUserCoin value)? updateUserCoin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentEventCopyWith<$Res> {
  factory $PaymentEventCopyWith(
          PaymentEvent value, $Res Function(PaymentEvent) then) =
      _$PaymentEventCopyWithImpl<$Res, PaymentEvent>;
}

/// @nodoc
class _$PaymentEventCopyWithImpl<$Res, $Val extends PaymentEvent>
    implements $PaymentEventCopyWith<$Res> {
  _$PaymentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PaymentEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int page) loadPaymentList,
    required TResult Function(int page) loadPurchaseList,
    required TResult Function(int index) changeTab,
    required TResult Function() loadMore,
    required TResult Function() purchasesLoaded,
    required TResult Function(PaymentProduct product) purchaseBought,
    required TResult Function(Status status, PurchaseDetails? purchaseDetails)
        statusBuyChanged,
    required TResult Function(int productId, String purchaseId,
            String appProductId, String paymentToken, String? failedReason)
        updateUserCoin,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int page)? loadPaymentList,
    TResult? Function(int page)? loadPurchaseList,
    TResult? Function(int index)? changeTab,
    TResult? Function()? loadMore,
    TResult? Function()? purchasesLoaded,
    TResult? Function(PaymentProduct product)? purchaseBought,
    TResult? Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult? Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int page)? loadPaymentList,
    TResult Function(int page)? loadPurchaseList,
    TResult Function(int index)? changeTab,
    TResult Function()? loadMore,
    TResult Function()? purchasesLoaded,
    TResult Function(PaymentProduct product)? purchaseBought,
    TResult Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadPaymentList value) loadPaymentList,
    required TResult Function(_LoadPurchaseList value) loadPurchaseList,
    required TResult Function(_ChangeTabIndex value) changeTab,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_PurchasesLoaded value) purchasesLoaded,
    required TResult Function(_PurchaseBought value) purchaseBought,
    required TResult Function(_StatusBuyChanged value) statusBuyChanged,
    required TResult Function(_UpdateUserCoin value) updateUserCoin,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadPaymentList value)? loadPaymentList,
    TResult? Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult? Function(_ChangeTabIndex value)? changeTab,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult? Function(_PurchaseBought value)? purchaseBought,
    TResult? Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult? Function(_UpdateUserCoin value)? updateUserCoin,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadPaymentList value)? loadPaymentList,
    TResult Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult Function(_ChangeTabIndex value)? changeTab,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult Function(_PurchaseBought value)? purchaseBought,
    TResult Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult Function(_UpdateUserCoin value)? updateUserCoin,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PaymentEvent {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadPaymentListImplCopyWith<$Res> {
  factory _$$LoadPaymentListImplCopyWith(_$LoadPaymentListImpl value,
          $Res Function(_$LoadPaymentListImpl) then) =
      __$$LoadPaymentListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$LoadPaymentListImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$LoadPaymentListImpl>
    implements _$$LoadPaymentListImplCopyWith<$Res> {
  __$$LoadPaymentListImplCopyWithImpl(
      _$LoadPaymentListImpl _value, $Res Function(_$LoadPaymentListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$LoadPaymentListImpl(
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadPaymentListImpl implements _LoadPaymentList {
  const _$LoadPaymentListImpl(this.page);

  @override
  final int page;

  @override
  String toString() {
    return 'PaymentEvent.loadPaymentList(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPaymentListImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadPaymentListImplCopyWith<_$LoadPaymentListImpl> get copyWith =>
      __$$LoadPaymentListImplCopyWithImpl<_$LoadPaymentListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int page) loadPaymentList,
    required TResult Function(int page) loadPurchaseList,
    required TResult Function(int index) changeTab,
    required TResult Function() loadMore,
    required TResult Function() purchasesLoaded,
    required TResult Function(PaymentProduct product) purchaseBought,
    required TResult Function(Status status, PurchaseDetails? purchaseDetails)
        statusBuyChanged,
    required TResult Function(int productId, String purchaseId,
            String appProductId, String paymentToken, String? failedReason)
        updateUserCoin,
  }) {
    return loadPaymentList(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int page)? loadPaymentList,
    TResult? Function(int page)? loadPurchaseList,
    TResult? Function(int index)? changeTab,
    TResult? Function()? loadMore,
    TResult? Function()? purchasesLoaded,
    TResult? Function(PaymentProduct product)? purchaseBought,
    TResult? Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult? Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
  }) {
    return loadPaymentList?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int page)? loadPaymentList,
    TResult Function(int page)? loadPurchaseList,
    TResult Function(int index)? changeTab,
    TResult Function()? loadMore,
    TResult Function()? purchasesLoaded,
    TResult Function(PaymentProduct product)? purchaseBought,
    TResult Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
    required TResult orElse(),
  }) {
    if (loadPaymentList != null) {
      return loadPaymentList(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadPaymentList value) loadPaymentList,
    required TResult Function(_LoadPurchaseList value) loadPurchaseList,
    required TResult Function(_ChangeTabIndex value) changeTab,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_PurchasesLoaded value) purchasesLoaded,
    required TResult Function(_PurchaseBought value) purchaseBought,
    required TResult Function(_StatusBuyChanged value) statusBuyChanged,
    required TResult Function(_UpdateUserCoin value) updateUserCoin,
  }) {
    return loadPaymentList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadPaymentList value)? loadPaymentList,
    TResult? Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult? Function(_ChangeTabIndex value)? changeTab,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult? Function(_PurchaseBought value)? purchaseBought,
    TResult? Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult? Function(_UpdateUserCoin value)? updateUserCoin,
  }) {
    return loadPaymentList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadPaymentList value)? loadPaymentList,
    TResult Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult Function(_ChangeTabIndex value)? changeTab,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult Function(_PurchaseBought value)? purchaseBought,
    TResult Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult Function(_UpdateUserCoin value)? updateUserCoin,
    required TResult orElse(),
  }) {
    if (loadPaymentList != null) {
      return loadPaymentList(this);
    }
    return orElse();
  }
}

abstract class _LoadPaymentList implements PaymentEvent {
  const factory _LoadPaymentList(final int page) = _$LoadPaymentListImpl;

  int get page;
  @JsonKey(ignore: true)
  _$$LoadPaymentListImplCopyWith<_$LoadPaymentListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadPurchaseListImplCopyWith<$Res> {
  factory _$$LoadPurchaseListImplCopyWith(_$LoadPurchaseListImpl value,
          $Res Function(_$LoadPurchaseListImpl) then) =
      __$$LoadPurchaseListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$LoadPurchaseListImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$LoadPurchaseListImpl>
    implements _$$LoadPurchaseListImplCopyWith<$Res> {
  __$$LoadPurchaseListImplCopyWithImpl(_$LoadPurchaseListImpl _value,
      $Res Function(_$LoadPurchaseListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$LoadPurchaseListImpl(
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadPurchaseListImpl implements _LoadPurchaseList {
  const _$LoadPurchaseListImpl(this.page);

  @override
  final int page;

  @override
  String toString() {
    return 'PaymentEvent.loadPurchaseList(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPurchaseListImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadPurchaseListImplCopyWith<_$LoadPurchaseListImpl> get copyWith =>
      __$$LoadPurchaseListImplCopyWithImpl<_$LoadPurchaseListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int page) loadPaymentList,
    required TResult Function(int page) loadPurchaseList,
    required TResult Function(int index) changeTab,
    required TResult Function() loadMore,
    required TResult Function() purchasesLoaded,
    required TResult Function(PaymentProduct product) purchaseBought,
    required TResult Function(Status status, PurchaseDetails? purchaseDetails)
        statusBuyChanged,
    required TResult Function(int productId, String purchaseId,
            String appProductId, String paymentToken, String? failedReason)
        updateUserCoin,
  }) {
    return loadPurchaseList(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int page)? loadPaymentList,
    TResult? Function(int page)? loadPurchaseList,
    TResult? Function(int index)? changeTab,
    TResult? Function()? loadMore,
    TResult? Function()? purchasesLoaded,
    TResult? Function(PaymentProduct product)? purchaseBought,
    TResult? Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult? Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
  }) {
    return loadPurchaseList?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int page)? loadPaymentList,
    TResult Function(int page)? loadPurchaseList,
    TResult Function(int index)? changeTab,
    TResult Function()? loadMore,
    TResult Function()? purchasesLoaded,
    TResult Function(PaymentProduct product)? purchaseBought,
    TResult Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
    required TResult orElse(),
  }) {
    if (loadPurchaseList != null) {
      return loadPurchaseList(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadPaymentList value) loadPaymentList,
    required TResult Function(_LoadPurchaseList value) loadPurchaseList,
    required TResult Function(_ChangeTabIndex value) changeTab,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_PurchasesLoaded value) purchasesLoaded,
    required TResult Function(_PurchaseBought value) purchaseBought,
    required TResult Function(_StatusBuyChanged value) statusBuyChanged,
    required TResult Function(_UpdateUserCoin value) updateUserCoin,
  }) {
    return loadPurchaseList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadPaymentList value)? loadPaymentList,
    TResult? Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult? Function(_ChangeTabIndex value)? changeTab,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult? Function(_PurchaseBought value)? purchaseBought,
    TResult? Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult? Function(_UpdateUserCoin value)? updateUserCoin,
  }) {
    return loadPurchaseList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadPaymentList value)? loadPaymentList,
    TResult Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult Function(_ChangeTabIndex value)? changeTab,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult Function(_PurchaseBought value)? purchaseBought,
    TResult Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult Function(_UpdateUserCoin value)? updateUserCoin,
    required TResult orElse(),
  }) {
    if (loadPurchaseList != null) {
      return loadPurchaseList(this);
    }
    return orElse();
  }
}

abstract class _LoadPurchaseList implements PaymentEvent {
  const factory _LoadPurchaseList(final int page) = _$LoadPurchaseListImpl;

  int get page;
  @JsonKey(ignore: true)
  _$$LoadPurchaseListImplCopyWith<_$LoadPurchaseListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTabIndexImplCopyWith<$Res> {
  factory _$$ChangeTabIndexImplCopyWith(_$ChangeTabIndexImpl value,
          $Res Function(_$ChangeTabIndexImpl) then) =
      __$$ChangeTabIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ChangeTabIndexImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$ChangeTabIndexImpl>
    implements _$$ChangeTabIndexImplCopyWith<$Res> {
  __$$ChangeTabIndexImplCopyWithImpl(
      _$ChangeTabIndexImpl _value, $Res Function(_$ChangeTabIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ChangeTabIndexImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeTabIndexImpl implements _ChangeTabIndex {
  const _$ChangeTabIndexImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'PaymentEvent.changeTab(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTabIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTabIndexImplCopyWith<_$ChangeTabIndexImpl> get copyWith =>
      __$$ChangeTabIndexImplCopyWithImpl<_$ChangeTabIndexImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int page) loadPaymentList,
    required TResult Function(int page) loadPurchaseList,
    required TResult Function(int index) changeTab,
    required TResult Function() loadMore,
    required TResult Function() purchasesLoaded,
    required TResult Function(PaymentProduct product) purchaseBought,
    required TResult Function(Status status, PurchaseDetails? purchaseDetails)
        statusBuyChanged,
    required TResult Function(int productId, String purchaseId,
            String appProductId, String paymentToken, String? failedReason)
        updateUserCoin,
  }) {
    return changeTab(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int page)? loadPaymentList,
    TResult? Function(int page)? loadPurchaseList,
    TResult? Function(int index)? changeTab,
    TResult? Function()? loadMore,
    TResult? Function()? purchasesLoaded,
    TResult? Function(PaymentProduct product)? purchaseBought,
    TResult? Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult? Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
  }) {
    return changeTab?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int page)? loadPaymentList,
    TResult Function(int page)? loadPurchaseList,
    TResult Function(int index)? changeTab,
    TResult Function()? loadMore,
    TResult Function()? purchasesLoaded,
    TResult Function(PaymentProduct product)? purchaseBought,
    TResult Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadPaymentList value) loadPaymentList,
    required TResult Function(_LoadPurchaseList value) loadPurchaseList,
    required TResult Function(_ChangeTabIndex value) changeTab,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_PurchasesLoaded value) purchasesLoaded,
    required TResult Function(_PurchaseBought value) purchaseBought,
    required TResult Function(_StatusBuyChanged value) statusBuyChanged,
    required TResult Function(_UpdateUserCoin value) updateUserCoin,
  }) {
    return changeTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadPaymentList value)? loadPaymentList,
    TResult? Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult? Function(_ChangeTabIndex value)? changeTab,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult? Function(_PurchaseBought value)? purchaseBought,
    TResult? Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult? Function(_UpdateUserCoin value)? updateUserCoin,
  }) {
    return changeTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadPaymentList value)? loadPaymentList,
    TResult Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult Function(_ChangeTabIndex value)? changeTab,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult Function(_PurchaseBought value)? purchaseBought,
    TResult Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult Function(_UpdateUserCoin value)? updateUserCoin,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(this);
    }
    return orElse();
  }
}

abstract class _ChangeTabIndex implements PaymentEvent {
  const factory _ChangeTabIndex(final int index) = _$ChangeTabIndexImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$ChangeTabIndexImplCopyWith<_$ChangeTabIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
      _$LoadMoreImpl _value, $Res Function(_$LoadMoreImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl();

  @override
  String toString() {
    return 'PaymentEvent.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int page) loadPaymentList,
    required TResult Function(int page) loadPurchaseList,
    required TResult Function(int index) changeTab,
    required TResult Function() loadMore,
    required TResult Function() purchasesLoaded,
    required TResult Function(PaymentProduct product) purchaseBought,
    required TResult Function(Status status, PurchaseDetails? purchaseDetails)
        statusBuyChanged,
    required TResult Function(int productId, String purchaseId,
            String appProductId, String paymentToken, String? failedReason)
        updateUserCoin,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int page)? loadPaymentList,
    TResult? Function(int page)? loadPurchaseList,
    TResult? Function(int index)? changeTab,
    TResult? Function()? loadMore,
    TResult? Function()? purchasesLoaded,
    TResult? Function(PaymentProduct product)? purchaseBought,
    TResult? Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult? Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int page)? loadPaymentList,
    TResult Function(int page)? loadPurchaseList,
    TResult Function(int index)? changeTab,
    TResult Function()? loadMore,
    TResult Function()? purchasesLoaded,
    TResult Function(PaymentProduct product)? purchaseBought,
    TResult Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadPaymentList value) loadPaymentList,
    required TResult Function(_LoadPurchaseList value) loadPurchaseList,
    required TResult Function(_ChangeTabIndex value) changeTab,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_PurchasesLoaded value) purchasesLoaded,
    required TResult Function(_PurchaseBought value) purchaseBought,
    required TResult Function(_StatusBuyChanged value) statusBuyChanged,
    required TResult Function(_UpdateUserCoin value) updateUserCoin,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadPaymentList value)? loadPaymentList,
    TResult? Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult? Function(_ChangeTabIndex value)? changeTab,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult? Function(_PurchaseBought value)? purchaseBought,
    TResult? Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult? Function(_UpdateUserCoin value)? updateUserCoin,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadPaymentList value)? loadPaymentList,
    TResult Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult Function(_ChangeTabIndex value)? changeTab,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult Function(_PurchaseBought value)? purchaseBought,
    TResult Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult Function(_UpdateUserCoin value)? updateUserCoin,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements PaymentEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
abstract class _$$PurchasesLoadedImplCopyWith<$Res> {
  factory _$$PurchasesLoadedImplCopyWith(_$PurchasesLoadedImpl value,
          $Res Function(_$PurchasesLoadedImpl) then) =
      __$$PurchasesLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PurchasesLoadedImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$PurchasesLoadedImpl>
    implements _$$PurchasesLoadedImplCopyWith<$Res> {
  __$$PurchasesLoadedImplCopyWithImpl(
      _$PurchasesLoadedImpl _value, $Res Function(_$PurchasesLoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PurchasesLoadedImpl implements _PurchasesLoaded {
  const _$PurchasesLoadedImpl();

  @override
  String toString() {
    return 'PaymentEvent.purchasesLoaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PurchasesLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int page) loadPaymentList,
    required TResult Function(int page) loadPurchaseList,
    required TResult Function(int index) changeTab,
    required TResult Function() loadMore,
    required TResult Function() purchasesLoaded,
    required TResult Function(PaymentProduct product) purchaseBought,
    required TResult Function(Status status, PurchaseDetails? purchaseDetails)
        statusBuyChanged,
    required TResult Function(int productId, String purchaseId,
            String appProductId, String paymentToken, String? failedReason)
        updateUserCoin,
  }) {
    return purchasesLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int page)? loadPaymentList,
    TResult? Function(int page)? loadPurchaseList,
    TResult? Function(int index)? changeTab,
    TResult? Function()? loadMore,
    TResult? Function()? purchasesLoaded,
    TResult? Function(PaymentProduct product)? purchaseBought,
    TResult? Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult? Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
  }) {
    return purchasesLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int page)? loadPaymentList,
    TResult Function(int page)? loadPurchaseList,
    TResult Function(int index)? changeTab,
    TResult Function()? loadMore,
    TResult Function()? purchasesLoaded,
    TResult Function(PaymentProduct product)? purchaseBought,
    TResult Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
    required TResult orElse(),
  }) {
    if (purchasesLoaded != null) {
      return purchasesLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadPaymentList value) loadPaymentList,
    required TResult Function(_LoadPurchaseList value) loadPurchaseList,
    required TResult Function(_ChangeTabIndex value) changeTab,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_PurchasesLoaded value) purchasesLoaded,
    required TResult Function(_PurchaseBought value) purchaseBought,
    required TResult Function(_StatusBuyChanged value) statusBuyChanged,
    required TResult Function(_UpdateUserCoin value) updateUserCoin,
  }) {
    return purchasesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadPaymentList value)? loadPaymentList,
    TResult? Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult? Function(_ChangeTabIndex value)? changeTab,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult? Function(_PurchaseBought value)? purchaseBought,
    TResult? Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult? Function(_UpdateUserCoin value)? updateUserCoin,
  }) {
    return purchasesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadPaymentList value)? loadPaymentList,
    TResult Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult Function(_ChangeTabIndex value)? changeTab,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult Function(_PurchaseBought value)? purchaseBought,
    TResult Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult Function(_UpdateUserCoin value)? updateUserCoin,
    required TResult orElse(),
  }) {
    if (purchasesLoaded != null) {
      return purchasesLoaded(this);
    }
    return orElse();
  }
}

abstract class _PurchasesLoaded implements PaymentEvent {
  const factory _PurchasesLoaded() = _$PurchasesLoadedImpl;
}

/// @nodoc
abstract class _$$PurchaseBoughtImplCopyWith<$Res> {
  factory _$$PurchaseBoughtImplCopyWith(_$PurchaseBoughtImpl value,
          $Res Function(_$PurchaseBoughtImpl) then) =
      __$$PurchaseBoughtImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentProduct product});
}

/// @nodoc
class __$$PurchaseBoughtImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$PurchaseBoughtImpl>
    implements _$$PurchaseBoughtImplCopyWith<$Res> {
  __$$PurchaseBoughtImplCopyWithImpl(
      _$PurchaseBoughtImpl _value, $Res Function(_$PurchaseBoughtImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$PurchaseBoughtImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as PaymentProduct,
    ));
  }
}

/// @nodoc

class _$PurchaseBoughtImpl implements _PurchaseBought {
  const _$PurchaseBoughtImpl(this.product);

  @override
  final PaymentProduct product;

  @override
  String toString() {
    return 'PaymentEvent.purchaseBought(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseBoughtImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseBoughtImplCopyWith<_$PurchaseBoughtImpl> get copyWith =>
      __$$PurchaseBoughtImplCopyWithImpl<_$PurchaseBoughtImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int page) loadPaymentList,
    required TResult Function(int page) loadPurchaseList,
    required TResult Function(int index) changeTab,
    required TResult Function() loadMore,
    required TResult Function() purchasesLoaded,
    required TResult Function(PaymentProduct product) purchaseBought,
    required TResult Function(Status status, PurchaseDetails? purchaseDetails)
        statusBuyChanged,
    required TResult Function(int productId, String purchaseId,
            String appProductId, String paymentToken, String? failedReason)
        updateUserCoin,
  }) {
    return purchaseBought(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int page)? loadPaymentList,
    TResult? Function(int page)? loadPurchaseList,
    TResult? Function(int index)? changeTab,
    TResult? Function()? loadMore,
    TResult? Function()? purchasesLoaded,
    TResult? Function(PaymentProduct product)? purchaseBought,
    TResult? Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult? Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
  }) {
    return purchaseBought?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int page)? loadPaymentList,
    TResult Function(int page)? loadPurchaseList,
    TResult Function(int index)? changeTab,
    TResult Function()? loadMore,
    TResult Function()? purchasesLoaded,
    TResult Function(PaymentProduct product)? purchaseBought,
    TResult Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
    required TResult orElse(),
  }) {
    if (purchaseBought != null) {
      return purchaseBought(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadPaymentList value) loadPaymentList,
    required TResult Function(_LoadPurchaseList value) loadPurchaseList,
    required TResult Function(_ChangeTabIndex value) changeTab,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_PurchasesLoaded value) purchasesLoaded,
    required TResult Function(_PurchaseBought value) purchaseBought,
    required TResult Function(_StatusBuyChanged value) statusBuyChanged,
    required TResult Function(_UpdateUserCoin value) updateUserCoin,
  }) {
    return purchaseBought(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadPaymentList value)? loadPaymentList,
    TResult? Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult? Function(_ChangeTabIndex value)? changeTab,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult? Function(_PurchaseBought value)? purchaseBought,
    TResult? Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult? Function(_UpdateUserCoin value)? updateUserCoin,
  }) {
    return purchaseBought?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadPaymentList value)? loadPaymentList,
    TResult Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult Function(_ChangeTabIndex value)? changeTab,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult Function(_PurchaseBought value)? purchaseBought,
    TResult Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult Function(_UpdateUserCoin value)? updateUserCoin,
    required TResult orElse(),
  }) {
    if (purchaseBought != null) {
      return purchaseBought(this);
    }
    return orElse();
  }
}

abstract class _PurchaseBought implements PaymentEvent {
  const factory _PurchaseBought(final PaymentProduct product) =
      _$PurchaseBoughtImpl;

  PaymentProduct get product;
  @JsonKey(ignore: true)
  _$$PurchaseBoughtImplCopyWith<_$PurchaseBoughtImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusBuyChangedImplCopyWith<$Res> {
  factory _$$StatusBuyChangedImplCopyWith(_$StatusBuyChangedImpl value,
          $Res Function(_$StatusBuyChangedImpl) then) =
      __$$StatusBuyChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Status status, PurchaseDetails? purchaseDetails});

  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$StatusBuyChangedImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$StatusBuyChangedImpl>
    implements _$$StatusBuyChangedImplCopyWith<$Res> {
  __$$StatusBuyChangedImplCopyWithImpl(_$StatusBuyChangedImpl _value,
      $Res Function(_$StatusBuyChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? purchaseDetails = freezed,
  }) {
    return _then(_$StatusBuyChangedImpl(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      purchaseDetails: freezed == purchaseDetails
          ? _value.purchaseDetails
          : purchaseDetails // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc

class _$StatusBuyChangedImpl implements _StatusBuyChanged {
  const _$StatusBuyChangedImpl(this.status, {this.purchaseDetails});

  @override
  final Status status;
  @override
  final PurchaseDetails? purchaseDetails;

  @override
  String toString() {
    return 'PaymentEvent.statusBuyChanged(status: $status, purchaseDetails: $purchaseDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusBuyChangedImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.purchaseDetails, purchaseDetails) ||
                other.purchaseDetails == purchaseDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, purchaseDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusBuyChangedImplCopyWith<_$StatusBuyChangedImpl> get copyWith =>
      __$$StatusBuyChangedImplCopyWithImpl<_$StatusBuyChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int page) loadPaymentList,
    required TResult Function(int page) loadPurchaseList,
    required TResult Function(int index) changeTab,
    required TResult Function() loadMore,
    required TResult Function() purchasesLoaded,
    required TResult Function(PaymentProduct product) purchaseBought,
    required TResult Function(Status status, PurchaseDetails? purchaseDetails)
        statusBuyChanged,
    required TResult Function(int productId, String purchaseId,
            String appProductId, String paymentToken, String? failedReason)
        updateUserCoin,
  }) {
    return statusBuyChanged(status, purchaseDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int page)? loadPaymentList,
    TResult? Function(int page)? loadPurchaseList,
    TResult? Function(int index)? changeTab,
    TResult? Function()? loadMore,
    TResult? Function()? purchasesLoaded,
    TResult? Function(PaymentProduct product)? purchaseBought,
    TResult? Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult? Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
  }) {
    return statusBuyChanged?.call(status, purchaseDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int page)? loadPaymentList,
    TResult Function(int page)? loadPurchaseList,
    TResult Function(int index)? changeTab,
    TResult Function()? loadMore,
    TResult Function()? purchasesLoaded,
    TResult Function(PaymentProduct product)? purchaseBought,
    TResult Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
    required TResult orElse(),
  }) {
    if (statusBuyChanged != null) {
      return statusBuyChanged(status, purchaseDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadPaymentList value) loadPaymentList,
    required TResult Function(_LoadPurchaseList value) loadPurchaseList,
    required TResult Function(_ChangeTabIndex value) changeTab,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_PurchasesLoaded value) purchasesLoaded,
    required TResult Function(_PurchaseBought value) purchaseBought,
    required TResult Function(_StatusBuyChanged value) statusBuyChanged,
    required TResult Function(_UpdateUserCoin value) updateUserCoin,
  }) {
    return statusBuyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadPaymentList value)? loadPaymentList,
    TResult? Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult? Function(_ChangeTabIndex value)? changeTab,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult? Function(_PurchaseBought value)? purchaseBought,
    TResult? Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult? Function(_UpdateUserCoin value)? updateUserCoin,
  }) {
    return statusBuyChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadPaymentList value)? loadPaymentList,
    TResult Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult Function(_ChangeTabIndex value)? changeTab,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult Function(_PurchaseBought value)? purchaseBought,
    TResult Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult Function(_UpdateUserCoin value)? updateUserCoin,
    required TResult orElse(),
  }) {
    if (statusBuyChanged != null) {
      return statusBuyChanged(this);
    }
    return orElse();
  }
}

abstract class _StatusBuyChanged implements PaymentEvent {
  const factory _StatusBuyChanged(final Status status,
      {final PurchaseDetails? purchaseDetails}) = _$StatusBuyChangedImpl;

  Status get status;
  PurchaseDetails? get purchaseDetails;
  @JsonKey(ignore: true)
  _$$StatusBuyChangedImplCopyWith<_$StatusBuyChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserCoinImplCopyWith<$Res> {
  factory _$$UpdateUserCoinImplCopyWith(_$UpdateUserCoinImpl value,
          $Res Function(_$UpdateUserCoinImpl) then) =
      __$$UpdateUserCoinImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int productId,
      String purchaseId,
      String appProductId,
      String paymentToken,
      String? failedReason});
}

/// @nodoc
class __$$UpdateUserCoinImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$UpdateUserCoinImpl>
    implements _$$UpdateUserCoinImplCopyWith<$Res> {
  __$$UpdateUserCoinImplCopyWithImpl(
      _$UpdateUserCoinImpl _value, $Res Function(_$UpdateUserCoinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? purchaseId = null,
    Object? appProductId = null,
    Object? paymentToken = null,
    Object? failedReason = freezed,
  }) {
    return _then(_$UpdateUserCoinImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseId: null == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as String,
      appProductId: null == appProductId
          ? _value.appProductId
          : appProductId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentToken: null == paymentToken
          ? _value.paymentToken
          : paymentToken // ignore: cast_nullable_to_non_nullable
              as String,
      failedReason: freezed == failedReason
          ? _value.failedReason
          : failedReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateUserCoinImpl implements _UpdateUserCoin {
  const _$UpdateUserCoinImpl(
      {required this.productId,
      required this.purchaseId,
      required this.appProductId,
      required this.paymentToken,
      this.failedReason});

  @override
  final int productId;
  @override
  final String purchaseId;
  @override
  final String appProductId;
  @override
  final String paymentToken;
  @override
  final String? failedReason;

  @override
  String toString() {
    return 'PaymentEvent.updateUserCoin(productId: $productId, purchaseId: $purchaseId, appProductId: $appProductId, paymentToken: $paymentToken, failedReason: $failedReason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserCoinImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId) &&
            (identical(other.appProductId, appProductId) ||
                other.appProductId == appProductId) &&
            (identical(other.paymentToken, paymentToken) ||
                other.paymentToken == paymentToken) &&
            (identical(other.failedReason, failedReason) ||
                other.failedReason == failedReason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, purchaseId,
      appProductId, paymentToken, failedReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserCoinImplCopyWith<_$UpdateUserCoinImpl> get copyWith =>
      __$$UpdateUserCoinImplCopyWithImpl<_$UpdateUserCoinImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int page) loadPaymentList,
    required TResult Function(int page) loadPurchaseList,
    required TResult Function(int index) changeTab,
    required TResult Function() loadMore,
    required TResult Function() purchasesLoaded,
    required TResult Function(PaymentProduct product) purchaseBought,
    required TResult Function(Status status, PurchaseDetails? purchaseDetails)
        statusBuyChanged,
    required TResult Function(int productId, String purchaseId,
            String appProductId, String paymentToken, String? failedReason)
        updateUserCoin,
  }) {
    return updateUserCoin(
        productId, purchaseId, appProductId, paymentToken, failedReason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int page)? loadPaymentList,
    TResult? Function(int page)? loadPurchaseList,
    TResult? Function(int index)? changeTab,
    TResult? Function()? loadMore,
    TResult? Function()? purchasesLoaded,
    TResult? Function(PaymentProduct product)? purchaseBought,
    TResult? Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult? Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
  }) {
    return updateUserCoin?.call(
        productId, purchaseId, appProductId, paymentToken, failedReason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int page)? loadPaymentList,
    TResult Function(int page)? loadPurchaseList,
    TResult Function(int index)? changeTab,
    TResult Function()? loadMore,
    TResult Function()? purchasesLoaded,
    TResult Function(PaymentProduct product)? purchaseBought,
    TResult Function(Status status, PurchaseDetails? purchaseDetails)?
        statusBuyChanged,
    TResult Function(int productId, String purchaseId, String appProductId,
            String paymentToken, String? failedReason)?
        updateUserCoin,
    required TResult orElse(),
  }) {
    if (updateUserCoin != null) {
      return updateUserCoin(
          productId, purchaseId, appProductId, paymentToken, failedReason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadPaymentList value) loadPaymentList,
    required TResult Function(_LoadPurchaseList value) loadPurchaseList,
    required TResult Function(_ChangeTabIndex value) changeTab,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_PurchasesLoaded value) purchasesLoaded,
    required TResult Function(_PurchaseBought value) purchaseBought,
    required TResult Function(_StatusBuyChanged value) statusBuyChanged,
    required TResult Function(_UpdateUserCoin value) updateUserCoin,
  }) {
    return updateUserCoin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadPaymentList value)? loadPaymentList,
    TResult? Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult? Function(_ChangeTabIndex value)? changeTab,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult? Function(_PurchaseBought value)? purchaseBought,
    TResult? Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult? Function(_UpdateUserCoin value)? updateUserCoin,
  }) {
    return updateUserCoin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadPaymentList value)? loadPaymentList,
    TResult Function(_LoadPurchaseList value)? loadPurchaseList,
    TResult Function(_ChangeTabIndex value)? changeTab,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_PurchasesLoaded value)? purchasesLoaded,
    TResult Function(_PurchaseBought value)? purchaseBought,
    TResult Function(_StatusBuyChanged value)? statusBuyChanged,
    TResult Function(_UpdateUserCoin value)? updateUserCoin,
    required TResult orElse(),
  }) {
    if (updateUserCoin != null) {
      return updateUserCoin(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserCoin implements PaymentEvent {
  const factory _UpdateUserCoin(
      {required final int productId,
      required final String purchaseId,
      required final String appProductId,
      required final String paymentToken,
      final String? failedReason}) = _$UpdateUserCoinImpl;

  int get productId;
  String get purchaseId;
  String get appProductId;
  String get paymentToken;
  String? get failedReason;
  @JsonKey(ignore: true)
  _$$UpdateUserCoinImplCopyWith<_$UpdateUserCoinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
