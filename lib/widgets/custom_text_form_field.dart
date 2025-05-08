import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/style/style_text.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
    this.suffixIcon,
    required this.obsc,
    required this.txtInputType,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget label;
  final Widget? suffixIcon;
  final bool obsc;
  final TextInputType txtInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        keyboardType: txtInputType,
        obscureText: obsc,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          label: label,
          labelStyle: AppTextStyles.txt14,
          suffixIcon: suffixIcon,
          border: inputBorder(),
          focusedBorder: inputBorder(),
          enabledBorder: inputBorder(),
        ),
      ),
    );
  }
}

InputBorder inputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey, width: 1),
  );
}
