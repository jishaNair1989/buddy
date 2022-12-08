// import 'package:buddy1/model/createpost/createpostmodel.dart';
// import 'package:buddy1/model/createpost/createpostrespo.dart';
// import 'package:flutter/material.dart';
//
// class PostviewModel extends ChangeNotifier{
//   final textcontroller=TextEditingController();
//   bool isLoading=false;
//
//   Future<void> CretePostButton(context) async {
//     //  print('clicked');
//     if (applyFormKey.currentState!.validate()) {
//       isloading = true;
//       //  print('loading');
//       final CreatepostModel modelObj = CreatepostModel(
//         text: textcontroller.text,
//         images:
//
//       );
//           // jobId: jobid.id,
//           // fname: fistname.text,
//           // lname: lastname.text,
//           // email: emailcontroller.text,
//           // phone: phonecontroller.text,
//           // experience: experiencecontroller.text,
//           // userId: jobid.userId,
//           // qualification: qualificationcontroller.text);
//       // print(modelObj.email);
//       // print(modelObj.userId);
//       Applyresponse? applyresponse =
//       await ApplyService().applyjobservice(modelObj, context);
//       //  print(applyresponse);
//       if (applyresponse == null) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(ShowDialogs.popUp('some thing went wrong '));
//         _isLoadingFalse();
//         return;
//       } else if (applyresponse.applied == true) {
//         //   print('alredy UploDED');
//         RouteNavigator.pushReplacement(context, const AllJobs());
//         _isLoadingFalse();
//       } else if (applyresponse.applied == false) {
//         //  print('job applied done');
//         ScaffoldMessenger.of(context)
//             .showSnackBar(ShowDialogs.popUp('Already applied'));
//         _isLoadingFalse();
//       }
//     }
//   }
//
// }