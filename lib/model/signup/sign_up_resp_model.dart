class SignUpResponseModel {
  String? id;
  String? username;
  String? picture;
  String? firstName;
  String? lastName;
  String? token;
  bool? verified;
  bool? isBlocked;
  String message;

  SignUpResponseModel({
    this.id,
    this.username,
    this.picture,
    this.firstName,
    this.lastName,
    this.token,
    required this.verified,
    this.isBlocked,
    required this.message,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        id: json["id"],
        username: json["username"],
        picture: json["picture"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        token: json["token"],
        verified: json["verified"],
        isBlocked: json["isBlocked"],
        message: json["message"],
      );
}
