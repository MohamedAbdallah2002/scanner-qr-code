import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:hive/hive.dart';
import 'package:scann_qr_code/widgets/scan_screen/scanner_controller.dart';
import 'package:scann_qr_code/core/routes/route_name.dart';
import 'package:scann_qr_code/widgets/shared/custom_button_app.dart';
import 'package:scann_qr_code/widgets/shared/horizontal_line.dart';
import 'package:scann_qr_code/widgets/shared/menu_icon.dart';
import 'package:scann_qr_code/widgets/shared/page_title.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  @override
  _ScannerViewState createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  final ScannerController _scannerController = ScannerController();
  Barcode? barcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.black, width: double.infinity, height: double.infinity),
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
                    HorizontalLine(),
                    const SizedBox(height: 10),
                    MenuIcon(src: "assets/images/icon1.png"),
                    const SizedBox(height: 32),
                    PageTitle(txt: "Scan QR Code",),
                    const SizedBox(height: 16),
                    const Text(
                      "Place qr code inside the frame to scan please\navoid shake to get results quickly",
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
                              onDetect: (barcodeCapture) async {
                                _scannerController.controller.stop();
                                final scanned = barcodeCapture.barcodes.firstOrNull;

                                if (scanned != null) {
                                  setState(() {
                                    barcode = scanned;
                                  });

                                  final box = Hive.box<String>('scanned_codes');
                                  if (box.length >= 10) {
                                    await box.deleteAt(0);
                                  }
                                  await box.add(scanned.rawValue!);

                                  Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
                                    _scannerController.controller.start();
                                    Navigator.pushReplacementNamed(context, RouteName.scannResult);
                                  });
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


