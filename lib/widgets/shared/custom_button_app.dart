import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/style/style_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.txt});
  final String txt;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(319, 58),
        maximumSize: const Size(319, 58),
        backgroundColor: const Color(0xffFE7D55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onPressed: onPressed,
      child: Text(txt, style: AppTextStyles.txt16w),
    );
  }
}
