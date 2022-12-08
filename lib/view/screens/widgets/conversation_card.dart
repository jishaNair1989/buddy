import 'package:flutter/material.dart';

import '../../../model/conversations/conversation_model.dart';

class ConversationCard extends StatelessWidget {
  //var index;

  const ConversationCard({
    Key? key,
    required this.thread,
  }) : super(key: key);
  final ConversationModel thread;
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          leading: CircleAvatar(
            child: Text(thread.sender),
          ),
          title: Text(
            thread.text,
          ),
          // subtitle: const Text('Hi'),
          trailing: Text(thread.createdAt.toString())),
    );
  }
}
