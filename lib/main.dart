import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/routes/route_handler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scann_qr_code/firebase_options.dart';

Future< void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox<String>('scanned_codes');
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
