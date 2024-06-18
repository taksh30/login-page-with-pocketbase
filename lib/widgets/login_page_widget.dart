import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key,
      required this.obscureText,
      required this.hintText,
      required this.controller});
  final bool obscureText;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            constraints: const BoxConstraints(maxWidth: 380),
            isDense: true,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
            fillColor: Colors.grey.shade200,
            filled: true),
      ),
    );
  }
}
