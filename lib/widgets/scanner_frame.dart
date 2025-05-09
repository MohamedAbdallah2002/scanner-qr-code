import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scann_qr_code/core/routes/route_name.dart';
import 'package:scann_qr_code/widgets/scanner_controller.dart';

class ScannerFrame extends StatelessWidget {
  final ScannerController scannerController;

  const ScannerFrame({required this.scannerController, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: MobileScanner(
              controller: scannerController.controller,
              onDetect: (barcodeCapture) {
                final barcode = barcodeCapture.barcodes.firstOrNull;
                if (barcode != null) {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteName.scannResult,
                    arguments: barcode.rawValue,
                  );
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
