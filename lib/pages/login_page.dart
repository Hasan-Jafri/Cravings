// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:cravings/components/my_button.dart';
import 'package:cravings/components/my_textfield.dart';
import 'package:cravings/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function() onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // Login Method.

  void login() async {
    // get auth instance
    final _authService = AuthService();

// try sign in
    try {
      await _authService.signInWithEmailPassword(email.text, password.text);
    }
// Display error
    catch (e) {
      showDialog(
          barrierColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  "Incorrect credentials",
                  style: TextStyle(fontSize: 14),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Ok",
                        style: TextStyle(fontSize: 14),
                      ))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),

            SizedBox(
              height: 10,
            ),

            //Signup Field
            Text(
              'Cravings',
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            SizedBox(
              height: 50,
            ),
            //Email TextField
            MyTextField(
              controller: email,
              obscureText: false,
              hintText: 'Email',
            ),
            SizedBox(
              height: 25,
            ),

            //Password TextField
            MyTextField(
              controller: password,
              obscureText: true,
              hintText: "Password",
            ),
            SizedBox(
              height: 25,
            ),

            MyButton(onTap: login, text: "Sign In"),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
