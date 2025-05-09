import 'package:flutter/material.dart';
import 'package:scann_qr_code/widgets/scanner_controller.dart';

class ControlPanel extends StatelessWidget {
  final ScannerController scannerController;

  const ControlPanel({required this.scannerController, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.photo_library_outlined),
          color: const Color(0xff757575),
          onPressed: () async {
            await scannerController.startGalleryScan();
          },
        ),
        
        const SizedBox(width: 24),
        IconButton(
          icon: const Icon(Icons.flash_on),
          color: const Color(0xff757575),
          onPressed: () async {
            await scannerController.toggleTorch();
          },
        ),
      ],
    );
  }
}
