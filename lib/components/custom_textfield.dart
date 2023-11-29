import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// customTextField เป็น Widget ที่เราสร้าขึ้นมาเอง
// โดนมีการรัยค่าต่างงๆ มาจากภายนอก
// และส่งค่าต่างๆ กลับไปยังภายนอก

Widget customTextField({
  required TextEditingController controller,
  required String hintText,
  required Icon prefixIcon,
  required bool obscureText,
  TextInputType textInputType = TextInputType.text,
  required String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: textInputType,
    autofocus: false,
    enableSuggestions: false,
    autocorrect: false,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      fillColor: Colors.grey[300],
    ),
    validator: validator,
  );
}
