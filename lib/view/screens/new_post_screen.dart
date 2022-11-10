import 'dart:io';

import 'package:buddy1/model/postveiw/all_post_model.dart';
import 'package:buddy1/view/screens/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/new_post_view_model.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen(BuildContext context, {Key? key, required this.imageFile,}) : super(key: key);
  final File imageFile;
  @override
  Widget build(BuildContext context) {
    final provider = context.read<NewPost>();
    return Scaffold(
      appBar: AppBar(title: const Text('New post')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(child: Image.file(imageFile, fit: BoxFit.contain)),
            InputField(
              controller: provider.textController,
              hintText: 'Caption',
            ),
            SizedBox(
                width: double.infinity,
                child:
                    Consumer<NewPost>(builder: (context, provider, _) {
                  return ElevatedButton(
                      onPressed: () {
                        // if (provider.isLoading) return;
                        // provider.post(context, imageFile.path);
                      },
                      child: provider.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text('Post'));
                }))
          ],
        ),
      ),
    );
  }
}
