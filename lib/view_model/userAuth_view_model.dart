// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/user_model.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider() {
    loadUser();
  }
  User? user;
  static User? currUser;
  final storage = const FlutterSecureStorage();
  final String userId = 'user.id';
  final String userRefresh = 'user.refresh';
  final String userToken = 'user.token';

  saveUser(User user) {
    this.user = AuthProvider.currUser = user;
    storage.write(key: userId, value: user.id);
    storage.write(key: userToken, value: user.token);
    storage.write(key: userRefresh, value: user.refreshToken);
    //log('saved user');
    notifyListeners();
  }

  Future<User?> loadUser() async {
    Map<String, String> values = await storage.readAll();
    String? id = values[userId];
    String? token = values[userToken];
    String? refresh = values[userRefresh];
    if (id != null && refresh != null && token != null) {
      user = AuthProvider.currUser =
          User(token: token, id: id, refreshToken: refresh);
      notifyListeners();
    }
    return user;
  }

  deleteUser() async {
    user = null;
    await storage.deleteAll();
    notifyListeners();
  }
}
