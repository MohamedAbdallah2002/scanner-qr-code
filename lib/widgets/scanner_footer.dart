import 'package:flutter/material.dart';

class ScannerFooter extends StatelessWidget {
  const ScannerFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.photo_library_outlined, color: Color(0xff757575)),
        SizedBox(width: 24),
        Icon(Icons.keyboard_alt_outlined, color: Color(0xff757575)),
        SizedBox(width: 24),
        Icon(Icons.flash_on, color: Color(0xff757575)),
      ],
    );
  }
}
