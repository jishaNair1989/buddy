// To parse this JSON data, do
//
//     final createpostModel = createpostModelFromJson(jsonString);

import 'dart:convert';

CreatepostModel createpostModelFromJson(String str) => CreatepostModel.fromJson(json.decode(str));

String createpostModelToJson(CreatepostModel data) => json.encode(data.toJson());

class CreatepostModel {
  CreatepostModel({
    this.text,
    this.user,

  });

  String ?text;
  String? user;

  factory CreatepostModel.fromJson(Map<String, dynamic> json) => CreatepostModel(
    text: json["text"],
    user: json["user"],

  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "user": user,

  };
}

class Image {
  Image({
    this.url,
  });

  String? url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}
