// To parse this JSON data, do
//
//     final createpostRes = createpostResFromJson(jsonString);

import 'dart:convert';

CreatepostRes createpostResFromJson(String str) => CreatepostRes.fromJson(json.decode(str));

String createpostResToJson(CreatepostRes data) => json.encode(data.toJson());

class CreatepostRes {
  CreatepostRes({
    this.type,
    this.text,
    this.images,
    this.user,
    this.id,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  dynamic? type;
  String ?text;
  List<Image>? images;
  User? user;
  String? id;
  List<dynamic>? comments;
  DateTime? createdAt;
  DateTime ?updatedAt;
  int? v;

  factory CreatepostRes.fromJson(Map<String, dynamic> json) => CreatepostRes(
    type: json["type"],
    text: json["text"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    user: User.fromJson(json["user"]),
    id: json["_id"],
    comments: List<dynamic>.from(json["comments"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "text": text,
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "user": user!.toJson(),
    "_id": id,
    "comments": List<dynamic>.from(comments!.map((x) => x)),
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
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

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.picture,
  });

  String ?firstName;
  String ?id;
  String? lastName;
  String? username;
  String? picture;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "picture": picture,
  };
}
