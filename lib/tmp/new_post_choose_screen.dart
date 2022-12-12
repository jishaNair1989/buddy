// import 'dart:io';
// import 'package:buddy1/view/screens/widgets/button_wid.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../view_model/new_post_choose_view_model.dart';
// import '../../../view_model/new_post_view_model.dart';
// import '../widgets/new_post_choose.dart';
// import '../widgets/textfield.dart';

// class NewpostScreen extends StatelessWidget {
//   const NewpostScreen({Key? key, this.imageFile}) : super(key: key);
//   final File? imageFile;
//   @override
//   Widget build(BuildContext context) {
//     final newPostChooseController =
//         Provider.of<NewPostChooseViewModel>(context);
//     final newPostController = Provider.of<NewpostViewModel>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'New Post',
//         ),
//         backgroundColor: Colors.purpleAccent,
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(16.0),
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: SingleChildScrollView(
//           child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//             TextFieldWidget(
//               minLines: 10,
//               maxLines: null,
//               inputType: TextInputType.multiline,
//               controller: newPostChooseController.textController,
//               hintText: 'Start Typing....',
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   NewPostOpt(
//                     onPressed: () {
//                       newPostChooseController.onCamera(context);
//                     },
//                     icon: Icons.camera_alt,
//                     text: 'Camera',
//                   ),
//                   NewPostOpt(
//                     icon: Icons.photo,
//                     text: 'Gallery',
//                     onPressed: () {
//                       newPostChooseController.onGallery(context);
//                     },
//                   ),
//                   NewPostOpt(
//                     icon: Icons.video_camera_front,
//                     text: 'Video',
//                     onPressed: () {
//                       newPostChooseController.onVideo(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             ButtonWidget(
//                 text: 'POST',
//                 onTap: () {
//                   newPostController.onPost(
//                       context, newPostChooseController.imageFile?.path ?? '');
//                   // newPostController.post(
//                   //     context, newPostChooseController.imageFile?.path ?? '');
//                   // NewPostService().postImage();
//                   //NewPost().postImage(context,imageFile.path);
//                 })
//           ]),
//         ),
//       ),
//     );
//   }
// }
