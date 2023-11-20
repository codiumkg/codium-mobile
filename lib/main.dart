import 'package:codium/codium_app.dart';
import 'package:codium/core/storage/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'repositories/authorization/authorization.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractAuthorizationRepository>(
      () => AuthorizationRepository(dio: Dio()));
  WidgetsFlutterBinding.ensureInitialized();
  TokenStorage.init();
  runApp(const CodiumApp());
}
