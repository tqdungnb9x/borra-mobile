
part of 'app_utils.dart';
abstract class FileUtils {
  /// Load JSON from resource
  static Future<dynamic> loadJson(String path) async {
    String content = await rootBundle.loadString(path);
    return jsonDecode(content);
  }
}
