import 'package:flutter/material.dart';
import 'package:scann_qr_code/core/style/style_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, required this.label, this.validator,  this.obscureText=false, this.controller, this.suffixIcon, 
  });
final String label;
final String? Function(String?)? validator;
final bool obscureText;
final TextEditingController? controller;
final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.txt14,
        suffixIcon: suffixIcon,
        border: outLineInputBorder(),
        focusedBorder: outLineInputBorder(),
        enabledBorder: outLineInputBorder(),
      ),
      validator: validator,
    );
  }

  OutlineInputBorder outLineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      );
  }
}