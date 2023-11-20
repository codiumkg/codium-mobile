import 'package:codium/features/authorization/view/authorization_screen.dart';
import 'package:codium/features/home/home.dart';
import 'package:codium/view/splash_screen.dart';

final routes = {
  '/': (context) => const SplashScreen(),
  '/login': (context) => const AuthorizationScreen(),
  '/home': (context) => const HomeScreen(),
};
