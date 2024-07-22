part of 'app_config.dart';

class AppStyles {
  AppStyles._internal();
  static const String fontPreLight = "Pretendard-Light";
  static const String fontPreBold = "Pretendard-Bold";
  static const String fontPreMed = "Pretendard-Medium";
  static const String fontPreReg = "Pretendard-Regular";
  static const String fontPreSemi = "Pretendard-SemiBold";
  static const String fontNotoLight = "NotoSansKR-Light";
  static const String fontNotoBold = "NotoSansKR-Bold";
  static const String fontNotoMed = "NotoSansKR-Medium";
  static const String fontNotoReg = "NotoSansKR-Regular";

  static final TextStyle text40 = TextStyle(fontSize: 40.r, height: 1.5);
  static final TextStyle text32 = TextStyle(fontSize: 32.r, height: 1.5);
  static final TextStyle text28 = TextStyle(fontSize: 28.r, height: 1.5);
  static final TextStyle text24 = TextStyle(fontSize: 24.r, height: 1.5);
  static final TextStyle text22 = TextStyle(fontSize: 22.r, height: 1.5);
  static final TextStyle text20 = TextStyle(fontSize: 20.r, height: 1.5);
  static final TextStyle text18 = TextStyle(fontSize: 18.r, height: 1.5);
  static final TextStyle text17 = TextStyle(fontSize: 17.r, height: 1.5);
  static final TextStyle text16 = TextStyle(fontSize: 16.r, height: 1.5);
  static final TextStyle text15 = TextStyle(fontSize: 15.r, height: 1.5);
  static final TextStyle text14 = TextStyle(fontSize: 14.r, height: 1.5);
  static final TextStyle text13 = TextStyle(fontSize: 13.r, height: 1.5);
  static final TextStyle text12 = TextStyle(fontSize: 12.r, height: 1.5);
  static final TextStyle text10 = TextStyle(fontSize: 10.r, height: 1.5);
  static final TextStyle text9 = TextStyle(fontSize: 9.r, height: 1.5);
  static final TextStyle text8 = TextStyle(fontSize: 8.r, height: 1.5);

  static final TextStyle textUnderline = TextStyle(
    fontSize: 20.r,
    height: 1.5,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primary01.withOpacity(0.5),
    decorationThickness: 6.r,
    decorationStyle: TextDecorationStyle.dashed,
  );

  static final Style htmlStyle = Style(
    color: AppColors.black,
    textAlign: TextAlign.justify,
    fontFamily: AppStyles.fontPreReg,
    fontSize: FontSize(16.sp),
    fontWeight: AppStyles.text16.preReg.fontWeight,
    lineHeight: const LineHeight(24 / 14),
  );
  static final Style htmlMediumStyle = Style(
    color: AppColors.black,
    textAlign: TextAlign.justify,
    fontFamily: AppStyles.fontPreMed,
    fontSize: FontSize(16.sp),
    fontWeight: AppStyles.text16.preMed.fontWeight,
    lineHeight: const LineHeight(24 / 14),
  );
  static final Style htmlHeadingStyle = Style(
    color: AppColors.black,
    textAlign: TextAlign.justify,
    fontFamily: AppStyles.fontPreMed,
    fontSize: FontSize(18.sp),
    fontStyle: FontStyle.normal,
    fontWeight: AppStyles.text16.preSemiBold.fontWeight,
    lineHeight: const LineHeight(24 / 14),
  );

  //Define decoration for button, container
  static final BoxDecoration containerDecoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(AppSize.mediumRadius),
    border: Border.all(
      color: AppColors.black.withOpacity(0.06),
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.black.withOpacity(0.06),
        blurRadius: 8,
        offset: const Offset(0, 6),
        spreadRadius: 0,
      )
    ],
  );
}

extension TextStyleExt on TextStyle {
  TextStyle get preSemiBold =>
      copyWith(fontFamily: AppStyles.fontPreSemi, color: AppColors.neutral01);
  TextStyle get preLight =>
      copyWith(fontFamily: AppStyles.fontPreLight, color: AppColors.neutral01);
  TextStyle get preMed =>
      copyWith(fontFamily: AppStyles.fontPreMed, color: AppColors.neutral01);
  TextStyle get preReg =>
      copyWith(fontFamily: AppStyles.fontPreReg, color: AppColors.neutral01);
  TextStyle get preBold =>
      copyWith(fontFamily: AppStyles.fontPreBold, color: AppColors.neutral01);
}
