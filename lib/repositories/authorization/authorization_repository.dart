import 'dart:convert';

import 'package:codium/core/storage/token_storage.dart';
import 'package:codium/repositories/models/user_data_model.dart';
import 'package:dio/dio.dart';

import 'authorization.dart';

class AuthorizationRepository implements AbstractAuthorizationRepository {
  AuthorizationRepository({required this.dio});

  final Dio dio;

  @override
  Future<void> login(String username, String password) async {
    try {
      final response = await Dio().post(
        'https://api.codiumdev.com/auth/login',
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 201) {
        String? data = jsonEncode(UserDataModel.fromJson(response.data));
        TokenStorage.putUserData(data);
      } else if (response.statusCode != 400) {
        throw Exception('Failed to get token');
      }
    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  @override
  Future<bool> checkTokenExpired(String? token) async {
    try {
      final response =
          await Dio(BaseOptions(headers: {'Authorization': 'Bearer $token'}))
              .get('https://api.codiumdev.com/auth/status');
      if (response.statusCode == 200) {
        return false;
      } else if (response.statusCode == 401) {
        return true;
      }
      throw Exception("Failed");
    } catch (error) {
      throw Exception('Failed to check token');
    }
  }
}
