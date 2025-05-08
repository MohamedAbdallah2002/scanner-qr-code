import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/style/style_text.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Container(
        width: 319,
        height: 58,
        decoration: BoxDecoration(
          color: const Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),

            Image.asset("assets/images/icon3.png"),
            const SizedBox(width: 32),
            Text(
              "7E0918FF",
              style: AppTextStyles.txt14f.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
