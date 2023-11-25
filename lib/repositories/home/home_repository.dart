import 'dart:convert';
import 'dart:io';

import 'package:codium/core/storage/token_storage.dart';
import 'package:codium/repositories/models/group_data_model.dart';
import 'package:codium/repositories/models/section_data_model.dart';
import 'package:dio/dio.dart';

import 'home.dart';

class HomeRepository implements AbstractGroupRepository {
  HomeRepository({required this.dio});

  final Dio dio;

  @override
  Future<Group?> group() async {
    final data = await TokenStorage.getUserData();
    try {
      final response = await Dio(
          BaseOptions(headers: {'Authorization': 'Bearer ${data?.token}'})).get(
        'https://api.codiumdev.com/groups?username=${data?.user?.username}',
      );

      if (response.statusCode == 200) {
        final data = Group.fromJson(response.data);
        return data;
      }
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } catch (error) {
      if (error is DioException) {
        if (error.response?.statusCode == 401) {
          throw Exception('Произошла ошибка');
        } else if (error.type == DioExceptionType.connectionError ||
            error.type == DioExceptionType.connectionTimeout) {
          throw Exception('Нет подключения к интернету');
        }
      }
      throw Exception('Error : $error');
    }
  }

  @override
  Future<List<Section>?> section() async {
    final data = await TokenStorage.getUserData();
    try {
      final response = await Dio(
          BaseOptions(headers: {'Authorization': 'Bearer ${data?.token}'})).get(
        'https://api.codiumdev.com/sections',
      );

      if (response.statusCode == 200) {
        List<Section> sections = List<Section>.from(response.data.map((e) {
          return Section.fromJson(e);
        }).toList());
        return sections;
      }
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } catch (error) {
      if (error is DioException) {
        if (error.response?.statusCode == 401) {
          throw Exception('Произошла ошибка');
        } else if (error.type == DioExceptionType.connectionError ||
            error.type == DioExceptionType.connectionTimeout) {
          throw Exception('Нет подключения к интернету');
        }
      }
      throw Exception('Error : $error');
    }
  }
}
