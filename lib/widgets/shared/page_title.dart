import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String txt;
  const PageTitle({
    required this.txt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}