import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  const MyTextField(
      {super.key,
      required this.controller,
      this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 12,
        ),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 25, bottom: 25, left: 20),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          hintText: hintText ?? '',
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 12),
        ),
      ),
    );
  }
}
