import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isClicked;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.isClicked});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(255, 195, 141, 1),
          foregroundColor: const Color(0xFF1a1817),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      child: isClicked
          ? Text(text)
          : const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              )),
    );
  }
}
