import 'dart:io';

import 'package:codium/core/storage/token_storage.dart';
import 'package:codium/repositories/models/topic_data_model.dart';
import 'package:codium/repositories/models/topic_details_data_model.dart';
import 'package:codium/repositories/topic_details/abstract_topic_details_repository.dart';
import 'package:dio/dio.dart';

class TopicDetailsRepository implements AbstractTopicDetailsRepository {
  TopicDetailsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<TopicDetails>?> topicDetails(int topicId) async {
    final data = await TokenStorage.getUserData();
    try {
      final response = await Dio(
          BaseOptions(headers: {'Authorization': 'Bearer ${data?.token}'})).get(
        'https://api.codiumdev.com/topics/$topicId/get-content/',
      );

      if (response.statusCode == 200) {
        List<TopicDetails> topics =
            List<TopicDetails>.from(response.data.map((e) {
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
