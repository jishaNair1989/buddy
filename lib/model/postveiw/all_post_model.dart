import 'package:flutter/material.dart';

class Slots extends User {
  final captionController = TextEditingController();
  List<PostData>? listOfSlots;
  String? message;
  String? userId;
  Slots({
    this.listOfSlots,
    this.message,
  });
  factory Slots.fromJson(List<dynamic> parsedJson) {
    return Slots(
      listOfSlots: parsedJson.isEmpty
          ? []
          : parsedJson.map((i) => PostData.fromJson(i)).toList(),
    );
  }
}

class PostData {
  PostData({
    this.id,
    this.type,
    this.images,
    this.user,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.text,
    this.background,
    this.homeDatumComments,
  });

  String? id;
  String? type;
  List<String>? images;
  User? user;
  List<dynamic>? comments;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? text;
  String? background;
  List<Comment>? homeDatumComments;

  factory PostData.fromJson(Map<String, dynamic> json) => PostData(
        id: json["_id"],
        type: json["type"],
        images: List<String>.from(json["images"].map((x) => x)),
        user: User.fromJson(json["user"]),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        text: json["text"],
        background: json["background"],
        homeDatumComments: json["comments"] == null
            ? null
            : List<Comment>.from(
                json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "user": user!.toJson(),
        "Comments": List<dynamic>.from(comments!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "text": text,
        "background": background,
        "comments": homeDatumComments == null
            ? null
            : List<dynamic>.from(homeDatumComments!.map((x) => x.toJson())),
      };
}

class Comment {
  Comment({
    this.comment,
    this.image,
    this.commentBy,
    this.commentAt,
    this.id,
  });

  String? comment;
  String? image;
  String? commentBy;
  DateTime? commentAt;
  String? id;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comment: json["comment"],
        image: json["image"],
        commentBy: json["commentBy"],
        commentAt: DateTime.parse(json["commentAt"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "image": image,
        "commentBy": commentBy,
        "commentAt": commentAt!.toIso8601String(),
        "_id": id,
      };
}

// class Images {
//   Images({
//     this.url,
//   });

//   String? url;

//   factory Images.fromJson(Map<String, dynamic> json) => Images(
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//       };
// }

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.picture,
    this.gender,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? picture;
  String? gender;

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

List<Slots> postsFromJson(List list) =>
    List<Slots>.from(list.map((x) => Slots.fromJson(x)));


