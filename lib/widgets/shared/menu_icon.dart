import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final String src;
  const MenuIcon({
    required this.src,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 21.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Image.asset(src),
      ),
    );
  }
}