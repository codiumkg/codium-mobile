import 'package:codium/core/router/router.dart';
import 'package:codium/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CodiumApp extends StatelessWidget {
  const CodiumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme, debugShowCheckedModeBanner: false, routes: routes);
  }
}
