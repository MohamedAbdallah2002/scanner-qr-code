import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/style/style_text.dart';

class ScanResultItem extends StatelessWidget {
  final String code;
  const ScanResultItem({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: const Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Image.asset(
              "assets/images/icon3.png",
              width: 24, // Set size for image to prevent overflow
              height: 24,
            ),
            const SizedBox(width: 16), // Reduce spacing here
            Expanded( // Ensure text does not overflow
              child: Text(
                code,
                style: AppTextStyles.txt14f.copyWith(color: Colors.black),
                overflow: TextOverflow.ellipsis, // Handles overflow
                softWrap: false, // Prevent text wrapping
                maxLines: 1, // Prevent multiple lines if necessary
              ),
            ),
          ],
        ),
      ),
    );
  }
}
