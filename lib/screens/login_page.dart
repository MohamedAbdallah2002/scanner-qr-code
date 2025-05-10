import 'package:flutter/material.dart';
import 'package:scann_qr_code/widgets/login_screen/login_form.dart';
import 'package:scann_qr_code/widgets/login_screen/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LoginHeader(),
          Spacer(),
          LoginForm(),
          Spacer(),

        ],
      ),
    );
  }
}



