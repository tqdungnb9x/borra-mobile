part of 'app_config.dart';

class AppImages {
/*
 Naming follow by rule when add images config
 * * Naming Rule: [type][page][detail][serialNumber][status].[extension]
 * @param [type] type of image. Ex: Icon -> ic, Image -> img,...
 * @param [page] page using image. Ex: home, menu, account,... 
 * @param [detail] detail when using image. Ex: background,... 
 * @param [serialNumber] add serial number when using multiple image for one position. Ex: 01, 02,...
 * @param [status] image using for one special status. Ex: active, inactive, on, off,...
 * Ex: Image using for background at home page: imgHomeBg.png
 * Ex: In home page using 2 icons for button: icHomeBnt01,png, icHomeBtn02.png
 */

//* Icons
  static const String icDefault = '';
  static const String icHomeBg01 = '';
  static const String icDropdown = "assets/icons/ic_dropdown_expand.svg";
  static const String icHome = "assets/icons/home.svg";
  static const String icCategory = "assets/icons/category.svg";
  static const String icFavourite = "assets/icons/fav.svg";
  static const String icMyAccount = "assets/icons/account.svg";
  static const String icView = "assets/icons/eye_view.svg";
  static const String icMenu = "assets/icons/ic_menu.svg";
  static const String icSearch = "assets/icons/ic_search.svg";
  static const String icHotLabel = "assets/icons/ic_hot_label.svg";
  static const String icNewLabel = "assets/icons/ic_new_label.svg";
  static const String icReport = "assets/icons/ic_report.svg";
  static const String icFAQ = "assets/icons/ic_faq.svg";
  static const String icChat = "assets/icons/ic_chat.svg";
  static const String icWallet = "assets/icons/carbon_wallet.svg";
  static const String icLike = "assets/icons/ic_like.svg";
  static const String icCurrency = "assets/icons/ic_currency.svg";
  static const String icDiscountCate = "assets/icons/discount_coin_cate.svg";
  static const String icEdit = "assets/icons/ic_edit.svg";
  static const String icCalendar = "assets/icons/calendar.svg";
  static const String icMoon = "assets/icons/moon.svg";
  static const String icClock = "assets/icons/clock.svg";
  static const String icAll = "assets/icons/all.svg";
  static const String icTea = "assets/icons/tea.svg";
  static const String icDarkBright = "assets/icons/dark_bright.svg";
  static const String icTel = "assets/icons/tel.svg";
  static const String icNote = "assets/icons/note.svg";
  static const String icCard = "assets/icons/card.svg";
  static const String icLikeOutline = "assets/icons/icon_like.svg";
  static const String icShareOutline = "assets/icons/icon_share.svg";
  static const String icRadioNone = "assets/icons/radio_none.svg";
  static const String icRadioChecked = "assets/icons/radio_checked.svg";
  static const String icLikeNoFill = "assets/icons/ic_like_nofill.svg";
  static const String icLikeFill = "assets/icons/ic_like_fill.svg";
  static const String icFeedback1 = "assets/icons/feedback_icon_1.svg";
  static const String icFeedback2 = "assets/icons/feedback_icon_2.svg";
  static const String icFeedback3 = "assets/icons/feedback_icon_3.svg";
  static String icPreviewSign =
      "${AppConfig.instance.env.siteUrl}assets/contents/icons/name.svg";

  static const String icPrev = "assets/icons/arrow_prev.svg";
  static const String icNext = "assets/icons/arrow_next.svg";
  static const String icChecked = "assets/icons/ic_checked.svg";
  static const String icUncheck = "assets/icons/ic_uncheck.svg";
  static const String icShareKakao = "assets/icons/share_kakao.svg";
  static const String icShareLink = "assets/icons/share_link.svg";
  static const String icWaitingTime = "assets/icons/clock_ffe055.svg";
  static const String icCoinGrey = "assets/icons/coin_gray.svg";

//* Images
  static const String imgDefault = "";
  static const String imgHomeBg01 = 'assets/images/background_home.png';
  static const String imgLogo = "assets/images/logo.png";
  static const String imgLogoHome = "assets/images/logo_home.png";
  static const String imgLogoMain = "assets/images/logo.webp";
  static const String imgSplashLogo = "assets/images/splash_logo.png";
  static const String imgDefaultThumbnail =
      "assets/images/default_thumbnail.png";
  static const String imgCategoryBanner = "assets/images/category_banner.png";
  static const String imgAccountBanner = "assets/images/account_banner.png";
  static const String imgTarotCardBack = "assets/images/tarot_back.png";
  static const String imgTarotJudgment = "assets/images/tarot_judgment.png";
  static const String imgLight = "assets/images/light_image.png";
  static const String imgTutor = "assets/images/img_tutor.png";
  static const String imgFeedback1 = "assets/images/feedback_icon_1.png";
  static const String imgFeedback2 = "assets/images/feedback_icon_2.png";
  static const String imgFeedback3 = "assets/images/feedback_icon_3.png";
  static const String freeCoinBackground = "assets/images/free_coin_banner.jpg";

  /// Juyeog
  static const String imgJuyeogBack = "assets/images/juyeog/back.png";
  static const String imgJuyeog = "assets/images/juyeog/single_index.png";
  static const String imgJuyeog_0 = "assets/images/juyeog/single_0.png";
  static const String imgJuyeog_1 = "assets/images/juyeog/single_1.png";
  static const String imgJuyeog_2 = "assets/images/juyeog/single_2.png";
  static const String imgJuyeog_3 = "assets/images/juyeog/single_3.png";
  static const String imgJuyeog_4 = "assets/images/juyeog/single_4.png";
  static const String imgJuyeog_5 = "assets/images/juyeog/single_5.png";
  static const String imgJuyeog_6 = "assets/images/juyeog/single_6.png";
  static const String imgJuyeog_7 = "assets/images/juyeog/single_7.png";
  static const String imgReview = "assets/images/juyeog/img_app_review.jpg";
  static const String igmKakaoShare = "assets/images/img_kakao_share.png";
  static const String imgReviewRating = "assets/images/img_rating_review.png";
  static const String imgMiddleLogo = "assets/images/middle_logo.png";
  static const String hourglass = "assets/images/hourglass.png";
  static const String icTabCard = "assets/icons/tab-card.svg";
  static const String icTabDarkBright= "assets/icons/tab-dark-bright.svg";
  static const String icTabNote = "assets/icons/tab-note.svg";

  ///Tarot
  static String imgTarotResult =
      "${AppConfig.instance.env.siteUrl}assets/contents/tarot/result/";

  ///Tarot
  static String imgCoinDiscount =
      "https://static.borra.today/borra/common/coin_gray.svg";

  ///Tarot
  static String imgJuyeogResult =
      "${AppConfig.instance.env.siteUrl}assets/contents/juyeog/result/";

  ///signIcon
  static String imgSignIcon =
      "${AppConfig.instance.env.siteUrl}assets/contents/icons/";

  ///signIcon
  static String imgDefaultImage =
      "${AppConfig.instance.env.siteUrl}assets/contents/thumbnail/default_thumbnail_rectangle.png";

  static String mapIconWithId(int id) {
    switch (id) {
      case 1:
        return imgFeedback1;
      case 2:
        return imgFeedback2;
      case 3:
        return imgFeedback3;
      default:
        return imgFeedback1;
    }
  }

  static String getIconSign(String name) {
    return '$imgSignIcon$name.svg';
  }

  static String getTarotResult(String name) {
    return '$imgTarotResult$name.jpg';
  }

  static String getJuyeogResult(String name) {
    return '$imgJuyeogResult$name.jpg';
  }
}
