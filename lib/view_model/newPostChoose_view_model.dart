import 'dart:developer';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class NewPostChooseViewModel extends ChangeNotifier {
  final cloudinary = CloudinaryPublic('dhdsnaxj0', 't7ff3xnj', cache: false);
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
      }
    });
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image!.path,
            resourceType: CloudinaryResourceType.Image),
      );

      print(response.secureUrl);
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
    }
  }
}

Future<void> _chooseVideo(ctx) async {
  final ImagePicker picker = ImagePicker();
  Future videoFile = picker.pickVideo(source: ImageSource.gallery);
  videoFile.then((file) async {
    videoFile = file;
  });
}
