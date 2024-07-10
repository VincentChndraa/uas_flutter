import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldCustom extends StatelessWidget {
  TextEditingController ctrl;
  bool isObscureText;
  String hint;
  IconData icon;

  TextFieldCustom({
    super.key,
    required this.ctrl,
    required this.hint,
    this.isObscureText = false,
    this.icon = Icons.email,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      child: TextField(
        controller: ctrl,
        obscureText: isObscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          hintText: hint,
          prefixIcon: Icon(icon),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
