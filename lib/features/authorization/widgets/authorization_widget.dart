import 'dart:async';

import 'package:codium/features/authorization/bloc/authorization_bloc.dart';
import 'package:codium/features/authorization/widgets/costom_button.dart';
import 'package:codium/features/authorization/widgets/custom_field_text.dart';
import 'package:codium/repositories/authorization/authorization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AuthorizationField extends StatefulWidget {
  const AuthorizationField({super.key});

  @override
  State<AuthorizationField> createState() => _AuthorizationFieldState();
}

class _AuthorizationFieldState extends State<AuthorizationField> {
  // ignore: non_constant_identifier_names
  final _AuthorizationBloc = AuthorizationBloc(
    GetIt.I<AbstractAuthorizationRepository>(),
  );

  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  late FocusNode _focusNodeLogin;
  late FocusNode _focusNodePassword;
  bool isPasswordVisible = false;
  bool isButtonActive = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _focusNodeLogin = FocusNode();
    _focusNodePassword = FocusNode();
    _passwordController.addListener(() {
      setState(() => updateButtonState());
    });
    _loginController.addListener(() => updateButtonState());
  }

  void updateButtonState() {
    setState(() {
      isButtonActive = _loginController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
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
    return BlocListener<AuthorizationBloc, AuthorizationState>(
        bloc: _AuthorizationBloc,
        listener: (context, state) {
          if (state is AuthorizationLoading) {
            setState(() {
              isButtonActive = false;
            });
          } else if (state is AuthorizationSuccess) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (state is AuthorizationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error?.message?.toString() ?? ""),
                backgroundColor: Colors.red,
              ),
            );
            setState(() {
              isButtonActive = true;
            });
          }
        },
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
                  child: Image.asset('assets/codium_logo.png'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
                  child: SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        onPressed: isButtonActive
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  _AuthorizationBloc.add(LoadAuthorization(
                                      username: _loginController.text,
                                      password: _passwordController.text));
                                  setState(() {
                                    isButtonActive = false;
                                  });
                                }
                              }
                            : null,
                        text: "Войти",
                        isActive: isButtonActive,
                        controllerLogin: _loginController,
                        controllerPassword: _passwordController,
                      )),
                )
              ],
            )));
  }
}
