import 'package:codium/core/constants/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isActive;
  final TextEditingController controllerLogin;
  final TextEditingController controllerPassword;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.isActive,
      required this.controllerLogin,
      required this.controllerPassword});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(255, 195, 141, 1),
        foregroundColor: const Color(0xFF1a1817),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        disabledBackgroundColor: CustomColors.darkAccentColor,
        disabledForegroundColor: const Color(0xFF1a1817),
      ),
      child: controllerLogin.text.isEmpty ||
              controllerPassword.text.isEmpty ||
              isActive
          ? Text(text)
          : !isActive ||
                  controllerLogin.text.isNotEmpty ||
                  controllerPassword.text.isNotEmpty
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ))
              : Text(text),
    );
  }
}
