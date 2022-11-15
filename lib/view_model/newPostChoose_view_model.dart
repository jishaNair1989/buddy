import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class NewPostChooseViewModel extends ChangeNotifier {
  bool isLoading = false;
  final File? image = null;
  File? imageFile;
  final textController = TextEditingController();

  onCamera(context) async {
    await _choosePhoto(context, ImageSource.camera);
  }

  onGallery(context) async {
    await _choosePhoto(context, ImageSource.gallery);
  }

  onVideo(context) async {
    await _chooseVideo(
      context,
    );
    notifyListeners();
  }

  onPostButton() {}

//   final createService = CreatePostService();
//   creatNewPost(context) {
//     //createService.createPost( )
//   }

  Future<void> _choosePhoto(BuildContext context, source) async {
    final ImagePicker picker = ImagePicker();
    picker
        .pickImage(
      source: source,
      maxHeight: 1080,
      maxWidth: 1080,
      imageQuality: 80,
      preferredCameraDevice: CameraDevice.front,
    )
        .then((image) {
      if (image != null) {
        log('done=======');
        imageFile = File(image.path);

        //  PushFunctions.pushReplace( NewPostScreen(imageFile: imageFile,));
      }
    });
  }
}

Future<void> _chooseVideo(ctx) async {
  final ImagePicker picker = ImagePicker();
  Future videoFile = picker.pickVideo(source: ImageSource.gallery);
  videoFile.then((file) async {
    videoFile = file;
  });
}
