import 'dart:convert';

CreatePostResponseModel createPostResponseModelFromJson(String str) =>
    CreatePostResponseModel.fromJson(json.decode(str));

class CreatePostResponseModel {
  CreatePostResponseModel({
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

  dynamic type;
  String? text;
  List<dynamic>? images;
  User? user;
  String? id;
  List<dynamic>? comments;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory CreatePostResponseModel.fromJson(Map<String, dynamic> json) =>
      CreatePostResponseModel(
        type: json["type"],
        text: json["text"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        user: User.fromJson(json["user"]),
        id: json["_id"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.picture,
  });

  String? id;
  String? firstName;
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
}
