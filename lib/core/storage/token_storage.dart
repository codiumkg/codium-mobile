import 'dart:convert';

import 'package:codium/core/constants/store_constants.dart';
import 'package:codium/repositories/models/user_data_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static late FlutterSecureStorage _storage;

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static void init() {
    _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  static void putUserData(String userData) async {
    await _storage.write(
        key: kUserDataKey, value: userData, aOptions: _getAndroidOptions());
  }

  static void clearUserData() async {
    await _storage.delete(key: kUserDataKey, aOptions: _getAndroidOptions());
  }

  static Future<UserDataModel?> getUserData() async {
    var res =
        await _storage.read(key: kUserDataKey, aOptions: _getAndroidOptions());

    if (res != null) {
      Map<String, dynamic> userDataMap =
          jsonDecode(res) as Map<String, dynamic>;

      return UserDataModel.fromJson(userDataMap);
    }
    return null;
  }
}
