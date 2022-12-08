// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupResponseModel signupModelFromJson(String str) =>
    SignupResponseModel.fromJson(json.decode(str));

class SignupResponseModel {
  SignupResponseModel({
    this.id,
    this.username,
    this.picture,
    this.firstName,
    this.lastName,
    this.token,
    this.verified,
    this.isBlocked,
    this.register,
    this.message,
  });

  String? id;
  String? username;
  String? picture;
  String? firstName;
  String? lastName;
  String? token;
  bool? verified;
  bool? isBlocked;
  bool? register;
  String? message;

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) => SignupResponseModel(
        id: json["id"],
        username: json["username"],
        picture: json["picture"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        token: json["token"],
        verified: json["verified"],
        isBlocked: json["isBlocked"],
        register: json["register"],
        message: json["message"],
      );
}
