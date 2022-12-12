import 'package:flutter/cupertino.dart';

import '../model/Conversations/conver_resp_model.dart';
import '../model/conversations/conversation_model.dart';
import '../services/converse_service.dart';
import '../view/screens/widgets/show_dialogue.dart';

class ConverseViewModel extends ChangeNotifier {
  List<ConversationModel> allMsg = [];
  bool isLoading = false;

  Future<void> getAllMessages(context) async {
    isLoading = true;
    notifyListeners();
    AllConversationResponse? response =
        await GetConversationService().getConversations(context);
    if (response?.isFailed == true) {
      ShowDialogs.popUp(response?.errormessage ?? 'Something went wrong !!');
      isLoading = false;
      notifyListeners();
      return;
    } else if (response?.dataList != null) {
      allMsg.clear();
      allMsg.addAll(response?.dataList ?? []);
      isLoading = false;
      notifyListeners();
      return;
    } else {
      return;
    }
  }
}
