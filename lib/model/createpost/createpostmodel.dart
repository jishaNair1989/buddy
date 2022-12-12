// To parse this JSON data, do
//
//     final createpostModel = createpostModelFromJson(jsonString);

import 'dart:convert';

import 'package:buddy1/model/createpost/imageresponse.dart';

CreatepostModel createpostModelFromJson(String str) => CreatepostModel.fromJson(json.decode(str));

String createpostModelToJson(CreatepostModel data) => json.encode(data.toJson());

class CreatepostModel {
  CreatepostModel({
    this.text,
    this.user,
    required this.img,
  });

  String ?text;
  String? user;
  List<ImageResponse> img;

  factory CreatepostModel.fromJson(Map<String, dynamic> json) => CreatepostModel(
    text: json["text"],
    user: json["user"],
    img: List<ImageResponse>.from(json['images'].map((x) => ImageResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "user": user,
    'images':List<dynamic>.from(img.map((x) => x.toJson())),
  };
}
