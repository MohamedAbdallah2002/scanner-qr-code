import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/routes/route_name.dart';
import 'package:scann_qr_code/screens/login_screen.dart';
import 'package:scann_qr_code/screens/result_screen.dart';
import 'package:scann_qr_code/screens/scanner_screen.dart';

class RouteHandler {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => const Login());
      case RouteName.scannerView:
        return MaterialPageRoute(builder: (_) => const ScannerView());
      case RouteName.scannResult:
        return MaterialPageRoute(builder: (_) => const ScannResult());
    }
    return null;
  }
}
