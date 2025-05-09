import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scann_qr_code/widgets/scanner_controller.dart';
import 'package:scann_qr_code/core/routes/route_name.dart';
import 'package:scann_qr_code/widgets/custom_button_app.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  @override
  _ScannerViewState createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  final ScannerController _scannerController = ScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: 70,
                      height: 5,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 21.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset("assets/images/icon1.png"),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Scan QR Code",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '''Place qr code inside the frame to scan please\navoid shake to get results quickly''',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    SizedBox(
                      width: 250,
                      height: 250,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: MobileScanner(
                              controller: _scannerController.controller,
                              onDetect: (barcodeCapture) {
                                final barcode =
                                    barcodeCapture.barcodes.firstOrNull;
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
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.photo_library_outlined),
                          color: const Color(0xff757575),
                          onPressed: () async {
                            await _scannerController.startGalleryScan();
                          },
                        ),
                        const SizedBox(width: 24),
                        IconButton(
                          icon: const Icon(Icons.flash_on),
                          color: const Color(0xff757575),
                          onPressed: () async {
                            await _scannerController.toggleTorch();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 54),
                      child: CustomButton(
                        txt: "Place Camera Code",
                        onPressed: () {
                          Navigator.pushNamed(context, RouteName.scannResult);
                        },
                      ),
                    ),
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
