import 'package:url_launcher/url_launcher.dart';

enum LauncherType {
  url,
  phone,
  email,
}

class UrlLauncherUtils {
  static launcher(
      {required String value, LauncherType type = LauncherType.url}) async {
    Uri? currentUrl;
    if (type == LauncherType.url) {
      currentUrl = Uri.parse(value);
    } else if (type == LauncherType.phone) {
      currentUrl = Uri(scheme: "tel", path: value.replaceAll(" ", ""));
    } else if (type == LauncherType.email) {
      currentUrl = Uri(scheme: "mailto", path: value.replaceAll(" ", ""));
    }
    if (currentUrl == null) return;
    await launchUrl(currentUrl, mode: LaunchMode.externalApplication);
  }

  static gotoTerm() {
    launcher(value: "https://app.catchsecu.com/document/P/0679c5f53dc81cc");
  }

  static gotoPolicy() {
    launcher(value: "https://app.catchsecu.com/document/P/0679c5f53dc81cc");
  }
}
