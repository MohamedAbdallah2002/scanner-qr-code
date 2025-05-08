import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/style/style_text.dart';

class ScannerHeader extends StatelessWidget {
  const ScannerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          width: 70,
          height: 5,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 21),
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset("assets/images/icon1.png"),
          ),
        ),
        const SizedBox(height: 32),
        Text("Scan QR Code", style: AppTextStyles.txt16b),
        const SizedBox(height: 16),
        Text(
          '''Place qr code inside the frame to scan please\navoid shake to get results quickly''',
          style: AppTextStyles.txt12,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
