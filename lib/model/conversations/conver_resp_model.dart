


import 'package:buddy1/model/conversations/conversation_model.dart';


class AllConversationResponse {
  AllConversationResponse({
    this.dataList,
    this.errormessage,
    this.isFailed,
  });

  List<ConversationModel>? dataList;
  String? errormessage;
  bool? isFailed;

  factory AllConversationResponse.fromJson(Map<String, dynamic> json) {
    return AllConversationResponse(
      dataList: (json as List).map((e) {
        return ConversationModel.fromJson(e);
      }).toList(),
      isFailed: false,
    );
  }
}
