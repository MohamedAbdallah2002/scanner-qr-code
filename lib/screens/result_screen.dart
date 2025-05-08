import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/style/style_text.dart';
import 'package:scann_qr_code/widgets/custom_button_app.dart';
import 'package:scann_qr_code/widgets/scan_result_item.dart';

class ScannResult extends StatelessWidget {
  const ScannResult({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> scannedCodes = [
      "7E0918FF",
      "8A72D3CC",
      "59F41AD7",
      "1C3B29A8",
      "9F8B3B1D",
    ];

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
              child: SafeArea(
                top: false,
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    Container(
                      width: 70,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(right: 21.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset("assets/images/icon2.png"),
                      ),
                    ),
                    const SizedBox(height: 32),

                    Text("Scanning Result", style: AppTextStyles.txt16b),
                    const SizedBox(height: 16),
                    Text(
                      '''Proreader will keep your last 10 days history.\nTo keep your all scanned history, please\npurchase our pro package.''',
                      style: AppTextStyles.txt12,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ListView.builder(
                          itemCount: scannedCodes.length,
                          itemBuilder: (context, index) {
                            return ScanResultItem(code: scannedCodes[index]);
                          },
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 16),
                      child: CustomButton(txt: "Send", onPressed: () {}),
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
