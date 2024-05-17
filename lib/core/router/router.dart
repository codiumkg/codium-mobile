import 'package:codium/features/authorization/view/authorization_screen.dart';
import 'package:codium/features/home/home.dart';
import 'package:codium/features/topic_details/view/topic_details_screen.dart';
import 'package:codium/view/splash_screen.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (context) => const SplashScreen(),
  '/login': (context) => const AuthorizationScreen(),
  '/home': (context) => const HomeScreen(),
  '/topicDetails': (context) {
    final topicId = ModalRoute.of(context)!.settings.arguments as List;
    return TopicDetailsScreen(
      topicId: topicId[0],
      topicTitle: topicId[1],
    );
  }
};
