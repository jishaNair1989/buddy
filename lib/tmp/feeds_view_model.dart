// import 'package:flutter/material.dart';

// import '../model/postveiw/all_post_model.dart';
// import '../services/api_service.dart';
// import '../services/new_post_service.dart';
// import '../utils/util.dart';

// class FeedsProvider with ChangeNotifier {
//   List<Slots> posts = [];
//   List<User> suggestions = [];
//   bool isLoading = true;
//   late GlobalKey<NavigatorState> navigatorKey;
//   init() {
//     if (posts.isEmpty) {
//       refresh();
//     }
//   }

//   Future<void> refresh() async {
//    // _loadSugestions();
//     await NewPostService()
//         .getPosts()
//         .whenComplete(() => _hideLoading())
//         .then((postList) => posts = postList)
//         .catchError((error) => _error('Loading failed', error, refresh));
//     notifyListeners();
//   }

//   // void refreshSuggestion() async {
//   //   suggestions = await UserService().getSuggestions();
//   //   notifyListeners();
//   // }

//   // void _loadSugestions() async {
//   //   suggestions = await UserService().getSuggestions();
//   // }

//   _error(String head, String e, Future Function() onRetry) {
//     final context = Util.navigatorState.currentContext!;
//     if (e == ApiService.neteorkError) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('$head, No Network'),
//           action: SnackBarAction(
//             label: 'Retry',
//             onPressed: () {
//               onRetry.call();
//             },
//           )));
//     } else {
//       Util.showSnackbar(e);
//     }
//   }

//   _hideLoading() {
//     isLoading = false;
//     notifyListeners();
//   }

//   removePost(String postId,index) {
//     posts.removeWhere((post) => post.listOfSlots?[index].id == postId);
//     notifyListeners();
//   }

//   // removePostsfromUser(String userId) {
//   //   posts.removeWhere((post) => post.listOfSlots.userId== userId);
//   //   notifyListeners();
//   // }

//   void reset() {
//     posts.clear();
//     suggestions.clear();
//   }
// }
