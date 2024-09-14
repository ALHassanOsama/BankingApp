// user_controller.dart
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/userModel.dart';

class UserController {
  Future<String?> getUserAccountId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userAccountID');
  }

  Future<UserModel?> fetchUserData(String s) async {
    final response = await http.get(Uri.parse('https://ptechapp-5ab6d15ba23c.herokuapp.com/users'));

    if (response.statusCode == 200) {
      try {
        List<dynamic> users = json.decode(response.body);
        for (var user in users) {
          if (user['userAccountID'] == s) {
            return UserModel.fromJson(user);
          }
        }
        log('No user found with the specified account ID.');
        return null;
      } catch (e) {
        throw Exception('Failed to parse user data: $e');
      }
    } else {
      throw Exception('Failed to load user list');
    }
  }
}
