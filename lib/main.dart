import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/routes/route_handler.dart';

void main() {
  runApp(Task());
}

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteHandler.generateRoute,
    );
  }
}
