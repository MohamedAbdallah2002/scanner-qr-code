import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:scann_qr_code/core/routes/route_name.dart';
import 'package:scann_qr_code/core/style/style_text.dart';
import 'package:scann_qr_code/widgets/shared/custom_button_app.dart';
import 'package:scann_qr_code/widgets/result_screen/scan_result_item.dart';
import 'package:scann_qr_code/widgets/shared/horizontal_line.dart';
import 'package:scann_qr_code/widgets/shared/menu_icon.dart';
import 'package:scann_qr_code/widgets/shared/page_title.dart';

class ScannResult extends StatefulWidget {
  const ScannResult({super.key});

  @override
  State<ScannResult> createState() => _ScannResultState();
}

class _ScannResultState extends State<ScannResult> {
  late Box<String> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<String>('scanned_codes');
  }

  @override
  Widget build(BuildContext context) {
    List<String> scannedCodes = box.values.toList().reversed.toList();

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
                    HorizontalLine(),
                    const SizedBox(height: 10),
                    MenuIcon(src: "assets/images/icon2.png"),
                    const SizedBox(height: 32),
                     PageTitle(txt: "Scanning Result",),
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
                            final code = scannedCodes[index];
                            final originalIndex = box.length - 1 - index;

                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20),
                                color: Colors.red,
                                child: const Icon(Icons.delete, color: Colors.white),
                              ),
                              onDismissed: (_) {
                                box.deleteAt(originalIndex);
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Item deleted")),
                                );
                              },
                              child: ScanResultItem(code: code),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 54,
                        vertical: 16,
                      ),
                      child: CustomButton(
                        txt: "Send",
                        onPressed: () {
                          Navigator.pushNamed(context, RouteName.scannerView);
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
