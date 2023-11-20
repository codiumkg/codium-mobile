import 'package:flutter/material.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF1a1817),
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromRGBO(255, 195, 141, 1)),
  useMaterial3: true,
  drawerTheme: drawerTheme,
  appBarTheme: appBarTheme,
);

const drawerTheme = DrawerThemeData(
  backgroundColor: Color(0xFF1a1817),
);

const appBarTheme = AppBarTheme(
  backgroundColor: Color(0xff23211f),
);
