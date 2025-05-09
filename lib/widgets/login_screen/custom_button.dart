import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/style/style_text.dart';

class CusttomButton extends StatelessWidget {
  const CusttomButton({
    super.key, required this.txt, this.onPressed,
  });
final String txt;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 50),
        maximumSize: const Size(300, 50),
        backgroundColor: const Color(0xFFFE7D55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed, child: Text(txt,style: AppTextStyles.txt16w));
  }
}