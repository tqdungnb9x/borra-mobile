part of 'extension.dart';

extension StringExt on String? {
  String withSymbols({String? currencyCode, String? symbol}) {
    if (this == null) {
      return "";
    }
    final NumberFormat oCcy;

    oCcy = NumberFormat.currency(
        locale: "ko", name: currencyCode ?? "KRW", customPattern: "#,###");
    double a = double.parse(this!);
    var sym = "원";
    switch (currencyCode) {
      case "KRW":
        sym = "원";
        break;
      default:
        sym = symbol ?? "원";
        break;
    }
    return oCcy.format(a.floor()) + sym;
  }

  bool get isPhoneNumber {
    if (this == null) {
      return false;
    }
    return RegExp(r"^[0-9]{8,11}$").hasMatch(this!);
  }

  bool get isCheckLowercaseChar {
    if (this == null) {
      return false;
    }
    return RegExp(r'[a-z]').hasMatch(this!);
  }

  bool get isCheckUppercaseChar {
    if (this == null) {
      return false;
    }
    return RegExp(r'[A-Z]').hasMatch(this!);
  }

  bool get isCheckNumberChar {
    if (this == null) {
      return false;
    }
    return RegExp(r'[0-9]').hasMatch(this!);
  }

  bool get isCheckSpecialChar {
    if (this == null) {
      return false;
    }
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this!);
  }

  double get symbolToDouble {
    if (this == null) {
      return 0;
    }
    var a = this!.replaceAll(",", '');
    return double.parse(a);
  }

  String markerName({String marker = '*'}) {
    if (this == null) {
      return '';
    }
    if (this!.length < 4) {
      return this!.replaceRange(1, this!.length, marker);
    }
    return this!.replaceRange(4, this!.length, marker);
  }

  bool get isTrue {
    return this! == "Y";
  }

  bool get isPassword {
    if (this == null) {
      return false;
    }
    if (this!.isEmpty) {
      return false;
    } else if (this!.length < 8 || this!.length > 16) {
      return false;
    } else if (isCheckLowercaseChar && isCheckUppercaseChar) {
      return true;
    } else if (isCheckLowercaseChar && isCheckSpecialChar) {
      return true;
    } else if (isCheckLowercaseChar && isCheckNumberChar) {
      return true;
    } else if (isCheckUppercaseChar && isCheckNumberChar) {
      return true;
    } else if (isCheckUppercaseChar && isCheckSpecialChar) {
      return true;
    } else if (isCheckNumberChar && isCheckSpecialChar) {
      return true;
    } else {
      return false;
    }
  }

  bool get isImageUrl {
    if (this == null) {
      return false;
    }
    return RegExp(r"(http(s?):)([/|.|\w|\s|\-|:])*\.(?:jpg|gif|png|jpeg|heic)")
        .hasMatch(this!.toLowerCase());
  }

  bool get isHttpUrl {
    if (this == null) {
      return false;
    }
    return this!.contains("http");
  }

  bool get isEmail {
    if (this == null) {
      return false;
    }
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(this!);
  }

  bool isFileWithType(List<String> types) {
    if (this == null) {
      return false;
    }
    final mimetype = lookupMimeType(this!);

    for (final type in types) {
      if (defaultExtensionMap[type] == mimetype) {
        return true;
      }
    }
    return false;
  }

  String shortFor({int shortForLength = 20}) {
    if (this == null) {
      return '';
    }
    assert(shortForLength >= 3);
    if (this!.length <= shortForLength - 3) {
      return this!;
    }
    final cutIndex = shortForLength ~/ 2;
    final remainingChar = shortForLength - cutIndex;
    return "${this!.substring(0, cutIndex)}...${this!.substring(this!.length - remainingChar + 3)}";
  }

  String get imageFormat {
    if (this == null) {
      return '';
    }
    final res = this!.split('.').last;
    return res;
  }
}
