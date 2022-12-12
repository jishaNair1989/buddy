import 'dart:developer';
import 'dart:io';

import 'package:buddy1/model/createpost/createpostmodel.dart';
import 'package:buddy1/services/create_post_service.dart';
import 'package:buddy1/services/imageservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key, required this.imageFile}) : super(key: key);
  final File imageFile;
  @override
  Widget build(BuildContext context) {
    final provider = context.read<NewPostProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('New post')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(child: Image.file(imageFile, fit: BoxFit.contain)),
            TextField(
              controller: provider.captionController,
              decoration: InputDecoration(
              hintText: 'Caption',
              )
            ),
            SizedBox(
                width: double.infinity,
                child:
                Consumer<NewPostProvider>(builder: (context, provider, _) {
                  return ElevatedButton(
                      onPressed: () {
                        print('safsadsfsfsfsafsad');
                        if (provider.isLoading) return;
                        provider.post(context, imageFile);
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

class NewPostProvider extends ChangeNotifier{
  bool isLoading = false;
  final captionController = TextEditingController();

  Future post(BuildContext context, File file) async{
    // isloading = true;
    try{
      log('started upload');
    final images =  await ImageUploadservice().uploadImage(file);
    final data = CreatepostModel(img: images, user:'', text: captionController.text );
    print(data.toJson().toString());
    await CreatePostService().CreateService(data, context);

    }catch(e){
      print(e);
    }

  }
}

