// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/routes/route_name.dart';
import 'package:scann_qr_code/core/style/style_text.dart';
import 'package:scann_qr_code/widgets/login_screen/custom_button.dart';
import 'package:scann_qr_code/widgets/login_screen/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                controller: email,
                label: "Email",
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                controller: password,
                label: "Password",
                obscureText: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot Password?", style: AppTextStyles.txt14f),
              ),
              const SizedBox(height: 48),
              CusttomButton(
                txt: "Login",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                      Navigator.pushReplacementNamed(context, RouteName.scannerView);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  }

                  // Handle login action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
