// To parse this JSON data, do
//
//     final conversationModel = conversationModelFromJson(jsonString);

import 'dart:convert';

ConversationModel conversationModelFromJson(String str) => ConversationModel.fromJson(json.decode(str));

// String conversationModelToJson(ConversationModel data) => json.encode(data.toJson());

class ConversationModel {
    ConversationModel({
        required this.conversationId,
        required this.sender,
        required this.text,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        this.v,
    });

    String conversationId;
    String sender;
    String text;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int? v;

    factory ConversationModel.fromJson(Map<String, dynamic> json) => ConversationModel(
        conversationId: json["conversationId"],
        sender: json["sender"],
        text: json["text"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    // Map<String, dynamic> toJson() => {
    //     "conversationId": conversationId,
    //     "sender": sender,
    //     "text": text,
    //     "_id": id,
    //     "createdAt": createdAt.toIso8601String(),
    //     "updatedAt": updatedAt.toIso8601String(),
    //     "__v": v,
    // };
}
