import 'dart:convert';

import 'package:ecommerce_app/data/data_utils/cache_helper.dart';
import 'package:injectable/injectable.dart';

import '../models/responses/auth_response.dart';

@injectable
class UserUtils {
  void saveToken(String token) {
    CacheData.setData(key: "token", value: token);
  }

  String? getToken() {
    return CacheData.getData(key: "token");
  }

  void saveUser(User user) {
    CacheData.setData(key: "user", value: jsonEncode(user.toJson()));
  }

  User? getUser(){
    String? userAsString = CacheData.getData(key: "user");
    if(userAsString == null) return null;
    return User.fromJson(jsonDecode(userAsString));
  }
}
