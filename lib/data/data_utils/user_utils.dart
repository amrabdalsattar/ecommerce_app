// import 'dart:convert';
//
// import 'package:injectable/injectable.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../models/responses/auth_response.dart';
//
// @injectable
// class UserUtils {
//   static void saveToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString("token", token);
//   }
//
//   static Future<String?> getToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     return prefs.getString("token");
//   }
//
//   static void saveUser(User user) async{
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString("user", jsonEncode(user.toJson()));
//   }
//
//   static Future<User?> getUser() async{
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userAsString = prefs.getString("user");
//     if (userAsString == null) return null;
//     return User.fromJson(jsonDecode(userAsString));
//   }
// }
