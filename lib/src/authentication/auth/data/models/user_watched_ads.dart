// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// import 'package:borra_app/app_base/extensions/extension.dart';

// part 'user_watched_ads.g.dart';

// @JsonSerializable()
// class UserWatchedAd extends Equatable {
//   final String status;
//   final String message;
//   final int coin;
//   @JsonKey(name: "remaining_watch_ad")
//   final int remainingWatchAd;

//   UserWatchedAd({
//     required this.status,
//     required this.message,
//     required this.coin,
//     required this.remainingWatchAd,
//   });

//   factory UserWatchedAd.empty() {
//     return UserWatchedAd(
//         status: "failed", message: "", coin: 0, remainingWatchAd: 0);
//   }

//   factory UserWatchedAd.fromMap(Map<String, dynamic> map) {
//     return UserWatchedAd(
//       status: map['status'] as String,
//       message: map['message'] as String,
//       coin: map['coin'] as int,
//       remainingWatchAd: map['remainingWatchAd'] as int,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'status': status,
//       'message': message,
//       'coin': coin,
//       'remainingWatchAd': remainingWatchAd,
//     };
//   }

//   String toJson() => json.encode(toMap());

//   factory UserWatchedAd.fromJson(Map<String, dynamic> json) =>
//       _$UserWatchedAdFromJson(json);

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props {
//     return [
//       status,
//       message,
//       coin,
//       remainingWatchAd,
//     ];
//   }
// }
