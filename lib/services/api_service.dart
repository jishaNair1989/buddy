import 'package:dio/dio.dart';

import '../model/user_model.dart';
import '../view_model/userAuth_view_model.dart';

abstract class ApiService {
  final _baseUrl = 'http://10.0.2.2:8000';

  ApiService() {
    _init();
  }
  String setEndPoint();
  User? get currUser => AuthProvider.currUser;
  Dio dio = Dio();
  void _init() {
    User? user = AuthProvider.currUser;
    if (user != null) {
      dio.options.headers['AuthToken'] = user.token;
    }
    dio.options.baseUrl = _baseUrl + setEndPoint();
  }

  String handleError(e) {
    print(e.toString());
    if (e is DioError) {
      if (e.response == null) {
        return networkError;
      }
      if (e.message.startsWith('SocketException')) {
        //log('network');
        return networkError;
      }
      if (e.response?.data is Map && e.response!.data['error'] != null) {
        return e.response!.data['error'];
      }
      //log(e.response!.data!.toString());
      //log('out');
      return defaultApiError;
    }
    return e.toString();
  }

  String defaultApiError = 'Something went wrong!';
  String networkError = 'No connection';
  static String get neteorkError => 'No connection';
}

extension ApiInt on int {
  int get statusType => (this / 100).floor() * 100;
}

extension BetterResponse on Response<dynamic> {
  ///returs true if status code between 200 and 299
  bool get isOk => statusCode != null ? statusCode!.statusType == 200 : false;
}
