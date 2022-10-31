// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post(
      {this.id,
      this.type,
      this.text,
      this.images,
      this.user,
      //this.background,
      this.postComments,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.comments,
      this.message});
  String? message;
  String? id;
  String? type;
  String? text;
  List<Image>? images;
  User? user;
  // dynamic? background;
  List<dynamic>? postComments;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<dynamic>? comments;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        message: json["message"],
        id: json["_id"],
        type: json["type"],
        text: json["text"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        user: User.fromJson(json["user"]),
        //background: json["background"],
        postComments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        comments: List<dynamic>.from(json["Comments"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "text": text,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "user": user?.toJson(),
        // "background": background,
        "comments": List<dynamic>.from(postComments!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "Comments": List<dynamic>.from(comments!.map((x) => x)),
      };
}

class Image {
  Image({
    required this.url,
  });

  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.picture,
    required this.gender,
  });

  String id;
  String firstName;
  String lastName;
  String username;
  String picture;
  String gender;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        picture: json["picture"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "picture": picture,
        "gender": gender,
      };
}
