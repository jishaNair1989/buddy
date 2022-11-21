import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Messages')),
        body: ListView.builder(
          itemBuilder: (context, index) => Dismissible(
            key: Key(index.toString()),
            child: const ListTile(
              leading: CircleAvatar(),
              subtitle: Text('message'),
              trailing: Icon(Icons.delete),
            ),
          ),
          itemCount: 10,
        ));
  }
}
