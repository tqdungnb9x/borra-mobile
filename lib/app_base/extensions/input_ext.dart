part of 'extension.dart';

extension InputDecorationExt on InputDecoration {
  InputDecoration allBorder(InputBorder border) {
    return copyWith(
      enabledBorder: border,
      border: border,
      disabledBorder: border,
      errorBorder: border,
      focusedBorder: border,
      focusedErrorBorder: border,
    );
  }
}

extension GetTrimmedText on TextEditingController {
  String get tText => text.trim();

  double get number => double.tryParse(tText) ?? 0;

  bool get isEmpty => tText.isEmpty;
}

class RemoveSpacesFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll('. ', '.');
    return newValue.copyWith(text: newText);
  }
}

class NameInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.replaceAll(RegExp(r'\s{2,}'), ' ') == oldValue.text) {
        return oldValue;
      }
    }
    return newValue;
  }
}

class RemoveSpaceAtFirst extends TextInputFormatter {
  RemoveSpaceAtFirst();
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.trimLeft() == oldValue.text) return oldValue;
    }
    return newValue;
  }
}
