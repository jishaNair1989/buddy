class SignInResponseModel {
  SignInResponseModel({
    required this.message,
    this.token,
    required this.verified,
  });

  String message;
  String? token;
  bool verified;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        message: json["message"] ?? "",
        token: json["token"] ?? "No token",
        verified: json["verified"] ?? false,
      );
}
