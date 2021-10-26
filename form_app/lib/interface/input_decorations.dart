import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration( {IconData? prefixIcon, required String labelText, required String hintText, IconData? suffixIcon}) {
    return InputDecoration(
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
                labelText: labelText,
                hintText: hintText,
                labelStyle: const TextStyle(color: Colors.grey),
                prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.deepPurple,) : null,
                suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.deepPurple,) : null,
              );
  }
}