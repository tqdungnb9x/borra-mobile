import 'package:borra_app/app_base/config/app_config.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class DeepLinkService {
  Future<Uri> createDeeplink(String subLink, String shareCode) async {
    print(shareCode);
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(
          "${AppConfig.instance.env.siteUrl}purcharse?id=${subLink}&shareCode=${shareCode}"),
      uriPrefix: "https://go.borra.today",
      androidParameters: AndroidParameters(
          packageName: "com.firstmecca.hellounsemobile",
          minimumVersion: 0,
          fallbackUrl: Uri.parse(
              "https://play.google.com/store/apps/details?id=com.firstmecca.hellounsemobile")),
      iosParameters: const IOSParameters(
        bundleId: "com.firstmecca.hellounsemobile",
        minimumVersion: '0',
        appStoreId: '1052093404',
      ),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);

    return dynamicLink;
  }

  shareToKakao(Uri link, String contentTitle, String description,
      String bannerURL) async {
    Map<String, String> serverCallbackArgs = {"": ""};
// Send a Feed message.
    try {
      FeedTemplate defaultFeed = FeedTemplate(
        content: Content(
            title: contentTitle,
            imageUrl: Uri.parse(bannerURL),
            link: Link(
              webUrl: link,
              mobileWebUrl: link,
            ),
            description: "$description\n$link"),
        buttons: [
          Button(
              title: "자세히 보기",
              link: Link(
                webUrl: link,
                mobileWebUrl: link,
              )),
        ],
      );
      Uri uri = await ShareClient.instance.shareDefault(
          template: defaultFeed, serverCallbackArgs: serverCallbackArgs);
      await ShareClient.instance.launchKakaoTalk(uri);
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
