import 'dart:io';

import 'package:codium/core/storage/token_storage.dart';
import 'package:codium/repositories/models/topic_data_model.dart';
import 'package:codium/repositories/topics/abstract_topics_repository.dart';
import 'package:dio/dio.dart';

class TopicsRepository implements AbstractTopicsRepository {
  TopicsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<Topic>?> topics(int sectionId) async {
    final data = await TokenStorage.getUserData();
    try {
      final response = await Dio(
          BaseOptions(headers: {'Authorization': 'Bearer ${data?.token}'})).get(
        'https://api.codiumdev.com/topics?SubjectId=$sectionId',
      );

      if (response.statusCode == 200) {
        List<Topic> topics = List<Topic>.from(response.data.map((e) {
          return Topic.fromJson(e);
        }).toList());
        return topics;
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
    return null;
  }
}
