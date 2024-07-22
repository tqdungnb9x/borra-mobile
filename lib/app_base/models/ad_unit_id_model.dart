class AdUnitId {
  late String android;
  late String iOS;

  AdUnitId({required this.android, required this.iOS});

  AdUnitId.fromJson(Map<String, dynamic> json) {
    android = json['android'];
    iOS = json['iOS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['android'] = this.android;
    data['iOS'] = this.iOS;
    return data;
  }
}
