import 'dart:convert';

NewPostModel imagePostModelFromJson(String str) =>
    NewPostModel.fromJson(json.decode(str));

String imagePostModelToJson(NewPostModel data) => json.encode(data.toJson());

class NewPostModel {
  NewPostModel({
    required this.userId,
    required this.file,
    required this.comments,
  });

  final String userId;
  final String file;
  final String comments;

  factory NewPostModel.fromJson(Map<String, dynamic> json) => NewPostModel(
        userId: json["userId"],
        file: json["file"],
        comments: json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "file": file,
        "comments": comments,
      };
}
