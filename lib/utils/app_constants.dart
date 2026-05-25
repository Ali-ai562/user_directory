import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppConstants {
  // static const String apiUrl = 'https://dummyjson.com/users';
  static void showLoading() {
    EasyLoading.show(status: 'Loading Users...');
  }

  static void hideLoading() {
    EasyLoading.dismiss();
  }
}
