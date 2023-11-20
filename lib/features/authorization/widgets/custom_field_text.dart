import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.focusNode,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    required this.obscureText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Color(0xffffffff)),
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffa0f538))),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff0dbd3))),
        hintStyle: const TextStyle(color: Color(0xffffffff)),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      validator: validator,
      onTapOutside: (event) => focusNode.unfocus(),
    );
  }
}
