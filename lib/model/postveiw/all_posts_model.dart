class AllPostsModel {
  AllPostsModel({
    this.id,
    //this.type,
    this.text,
    this.images,
    this.user,
    this.background,
    // this.comments,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  //dynamic type;
  String? text;
  List<Images>? images;
  User? user;
  dynamic background;
  //List<dynamic>? comments;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory AllPostsModel.fromJson(Map<String, dynamic> json) => AllPostsModel(
        id: json["_id"],
        //type: json["type"],
        text: json["text"],
        images:
            List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        //List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        user: User.fromJson(json["user"]),
        background: json["background"],
        // comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class Images {
  Images({
    this.url,
  });

  String? url;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
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

  Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "picture": picture,
      };
}
