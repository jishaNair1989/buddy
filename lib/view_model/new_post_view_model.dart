import 'dart:io';

import 'package:buddy1/services/post_create_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/push_functions.dart';
import '../view/screens/new_post_screen.dart';

class NewPost extends ChangeNotifier {
  bool isLoading = false;
  final File? image = null;
  final textController = TextEditingController();


  final createService = CreatePostService();
  creatNewPost() {
  //createService.createPost( )
}
}
 