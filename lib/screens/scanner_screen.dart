import 'package:flutter/material.dart';
import 'package:scann_qr_code/widgets/canner_header.dart';
import 'package:scann_qr_code/widgets/scanner_button.dart';
import 'package:scann_qr_code/widgets/scanner_camera_box.dart';
import 'package:scann_qr_code/widgets/scanner_footer.dart';

class ScannerView extends StatelessWidget {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.black),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: const SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    ScannerHeader(),
                    SizedBox(height: 48),
                    ScannerCameraBox(),
                    SizedBox(height: 16),
                    Text("Scanning Code...", textAlign: TextAlign.center),
                    SizedBox(height: 16),
                    ScannerFooter(),
                    SizedBox(height: 16),
                    ScannerButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
