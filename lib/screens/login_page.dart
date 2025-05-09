import 'package:flutter/material.dart';
import 'package:scann_qr_code/widgets/login_screen/login_form.dart';
import 'package:scann_qr_code/widgets/login_screen/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LoginHeader(),
            const SizedBox(height: 20),
            LoginForm(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}



