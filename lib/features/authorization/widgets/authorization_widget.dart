import 'dart:async';

import 'package:codium/features/authorization/widgets/costom_button.dart';
import 'package:codium/features/authorization/widgets/custom_field_text.dart';
import 'package:codium/repositories/authorization/authorization.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AuthorizationField extends StatefulWidget {
  const AuthorizationField({super.key});

  @override
  State<AuthorizationField> createState() => _AuthorizationFieldState();
}

class _AuthorizationFieldState extends State<AuthorizationField> {
  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  late FocusNode _focusNodeLogin;
  late FocusNode _focusNodePassword;
  bool isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = true;

  void _enableButton() {
    _isButtonEnabled = true;
  }

  void _disableButton() {
    setState(() {
      _isButtonEnabled = false;
      Timer(const Duration(seconds: 2), _enableButton); // Задержка в 2 секунды
    });
  }

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _focusNodeLogin = FocusNode();
    _focusNodePassword = FocusNode();
    _passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _loginController.dispose();
    _passwordController.dispose();
    _focusNodeLogin.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              child: Image.asset('assets/codium_logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: CustomTextFormField(
                focusNode: _focusNodeLogin,
                controller: _loginController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Введите имя пользователя";
                  }
                  return null;
                },
                hintText: 'Имя пользователя',
                obscureText: false,
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                child: CustomTextFormField(
                  focusNode: _focusNodePassword,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Введите пароль";
                    } else if (value.length < 6) {
                      return "Пароль должен быть больше 6 символов";
                    }
                    return null;
                  },
                  hintText: 'Пароль',
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: () {
                            _passwordController.clear();
                          },
                          child: _passwordController.text.isNotEmpty
                              ? const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.backspace_rounded,
                                    size: 20,
                                    color: Color(0xfff0dbd3),
                                  ),
                                )
                              : const SizedBox()),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xfff0dbd3),
                        ),
                      ),
                    ],
                  ),
                  obscureText: !isPasswordVisible,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _isButtonEnabled
                              ? GetIt.I<AbstractAuthorizationRepository>()
                                  .login(_loginController.text,
                                      _passwordController.text)
                                  .then((value) => Navigator.of(context)
                                      .pushReplacementNamed('/home'))
                                  .catchError((error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Неправильный логин или пароль"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                })
                              : null;
                        }
                        _disableButton();
                      },
                      text: "Войти")),
            )
          ],
        ));
  }
}
