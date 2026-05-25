// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:user_directory/model/user_model.dart';
// import 'package:user_directory/utils/app_constants.dart';
// import 'package:user_directory/widgets/shimmer_card.dart';

// class UserProvider extends ChangeNotifier {
//   UserModel? userModel;

//   bool isLoading = false;

//   Future<void> fetchUsers() async {
//     isLoading = true;
//     ShimmerCard();
//     // AppConstants.showLoading();
//     // notifyListeners();

//     try {
//       final response = await http.get(Uri.parse('https://dummyjson.com/users'));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         userModel = UserModel.fromJson(data);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }

//     isLoading = false;
//     AppConstants.hideLoading();
//     notifyListeners();
//   }

//   Future<void> refreshUsers() async {
//     await fetchUsers();
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:user_directory/model/user_model.dart';

class UserController extends GetxController {
  UserModel? userModel;

  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchUsers() async {
    if (isLoading) return;

    isLoading = true;
    errorMessage = null;
    update();

    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/users'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        userModel = UserModel.fromJson(data);
      } else {
        errorMessage = 'Server error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'Something went wrong';
      debugPrint(e.toString());
    }

    isLoading = false;
    update();
  }

  Future<void> refreshUsers() async {
    await fetchUsers();
  }
}
