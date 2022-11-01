// import 'dart:convert';

// List<Post> postFromJson(String str) =>
//     List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

// String postToJson(List<Post> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Post {
//   Post({
//     this.id,
//     this.type,
//     this.images,
//     this.user,
//     this.comments,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.text,
//     this.background,
//     this.postComments,
//     this.message,
//   });

//   String? id;
//   String? type;
//   List<Image>? images;
//   User? user;
//   List<dynamic>? comments;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   String? text;
//   String? background;
//   List<Comment>? postComments;
//   String? message;

//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//         id: json["_id"],
//         type: json["type"] == null ? null : json["type"],
//         images: json["images"] == null
//             ? null
//             : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//         user: User.fromJson(json["user"]),
//         comments: List<dynamic>.from(json["Comments"].map((x) => x)),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         text: json["text"] == null ? null : json["text"],
//         background: json["background"] == null ? null : json["background"],
//         postComments: json["comments"] == null
//             ? null
//             : List<Comment>.from(
//                 json["comments"].map((x) => Comment.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "type": type == null ? null : type,
//         "images": images == null
//             ? null
//             : List<dynamic>.from(images!.map((x) => x.toJson())),
//         "user": user!.toJson(),
//         "Comments": List<dynamic>.from(comments!.map((x) => x)),
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "__v": v,
//         "text": text == null ? null : text,
//         "background": background == null ? null : background,
//         "comments": postComments == null
//             ? null
//             : List<dynamic>.from(postComments!.map((x) => x.toJson())),
//       };
// }

// class Image {
//   Image({
//     this.url,
//   });

//   String? url;

//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//       };
// }

// class Comment {
//   Comment({
//     this.comment,
//     this.image,
//     this.commentBy,
//     this.commentAt,
//     this.id,
//   });

//   String? comment;
//   String? image;
//   String? commentBy;
//   DateTime? commentAt;
//   String? id;

//   factory Comment.fromJson(Map<String, dynamic> json) => Comment(
//         comment: json["comment"],
//         image: json["image"],
//         commentBy: json["commentBy"],
//         commentAt: DateTime.parse(json["commentAt"]),
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "comment": comment,
//         "image": image,
//         "commentBy": commentBy,
//         "commentAt": commentAt!.toIso8601String(),
//         "_id": id,
//       };
// }

// class User {
//   User({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.username,
//     this.picture,
//     this.gender,
//   });

//   String? id;
//   String? firstName;
//   String? lastName;
//   String? username;
//   String? picture;
//   String? gender;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["_id"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         username: json["username"],
//         picture: json["picture"],
//         gender: json["gender"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "first_name": firstName,
//         "last_name": lastName,
//         "username": username,
//         "picture": picture,
//         "gender": gender,
//       };
// }
