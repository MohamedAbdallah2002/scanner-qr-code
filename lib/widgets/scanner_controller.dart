import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:io';

class ScannerController {
  final MobileScannerController _controller = MobileScannerController();

  MobileScannerController get controller => _controller;

  Future<void> toggleTorch() async {
    await _controller.toggleTorch();
  }

  Future<void> startGalleryScan() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      _scanImage(imageFile);
    }
  }

  Future<void> _scanImage(File imageFile) async {
    final List<Barcode> barcodes =
        (await MobileScannerController().analyzeImage(imageFile as String))
            as List<Barcode>;
    if (barcodes.isNotEmpty) {
      print('Scanned QR Code: ${barcodes.first.rawValue}');
    } else {
      print('No QR code found in the image.');
    }
  }
}
