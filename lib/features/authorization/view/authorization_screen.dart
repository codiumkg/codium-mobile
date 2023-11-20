import 'package:codium/features/authorization/widgets/authorization_widget.dart';
import 'package:flutter/material.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  late FocusNode _focusNodeLogin;
  late FocusNode _focusNodePassword;

  @override
  void initState() {
    super.initState();
    _focusNodeLogin = FocusNode();
    _focusNodePassword = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _focusNodeLogin.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: AuthorizationField(),
      ),
    );
  }
}
