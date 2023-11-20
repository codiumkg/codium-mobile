import 'package:codium/core/storage/token_storage.dart';
import 'package:codium/repositories/authorization/authorization.dart';
import 'package:codium/repositories/authorization/authorization_repository.dart';
import 'package:codium/repositories/models/user_data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Image.asset('assets/codium_logo_solo.png', height: 90, width: 90),
      ),
    );
  }

  void checkToken() async {
    UserDataModel? token = await TokenStorage.getUserData();

    if (token != null) {
      bool? isExpired = await GetIt.I<AbstractAuthorizationRepository>()
          .checkTokenExpired(token.token);
      if (isExpired) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed('/login');
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }
}
