import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/routes/route_name.dart';
import 'package:scann_qr_code/widgets/custom_button_app.dart';

class ScannerButton extends StatelessWidget {
  const ScannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 54),
      child: CustomButton(
        txt: "Place Camera Code",
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            RouteName.scannResult,
          );
        },
      ),
    );
  }
}
