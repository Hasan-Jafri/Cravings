// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:cravings/components/my_button.dart';
import 'package:cravings/components/my_textfield.dart';
import 'package:cravings/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function() onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

  // Register Method
  void register() async {
    // Get Auth Service
    final _authService = AuthService();

    // Check if passoword and confirm password match
    if (password.text == confirmPass.text) {
      // Tru creating user
      try {
        await _authService.signUpWithEmailPassword(email.text, password.text);
      }

      // Error
      catch (e) {
        showDialog(
            barrierColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
            context: context,
            builder: (context) => AlertDialog(
                    title: Text(
                      "Something went wrong.",
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
                    ]));
      }
    }
    // If passwords don't match\
    else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  "Passwords don't match",
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
              "Let's create an account.",
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

            //Password TextField
            MyTextField(
              controller: confirmPass,
              obscureText: true,
              hintText: "Confirm Password",
            ),

            SizedBox(
              height: 25,
            ),

            MyButton(onTap: register, text: "Sign Up"),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account? ",
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
                    "Login now",
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
