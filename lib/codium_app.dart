import 'package:codium/core/router/router.dart';
import 'package:codium/core/theme/theme.dart';
import 'package:codium/features/topics/topics.dart';
import 'package:flutter/material.dart';

class CodiumApp extends StatelessWidget {
  const CodiumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      routes: routes,
      onGenerateRoute: (settings) {
        if (settings.name == '/topics') {
          final Map<String, dynamic>? args =
              settings.arguments as Map<String, dynamic>?;
          if (args != null) {
            final sectionId = args['sectionId'] as int;
            final sectionTitle = args['sectionTitle'] as String;
            // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => TopicsScreen(
                    sectionId: sectionId,
                    sectionTitle: sectionTitle)); // Pass it to BarPage.
          }
        }
        return null;
      },
    );
  }
}
