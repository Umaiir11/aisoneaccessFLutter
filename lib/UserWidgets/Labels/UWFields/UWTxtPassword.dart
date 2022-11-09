import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class UWTxtPassword extends StatefulWidget {

  UWTxtPassword({ required this.txtController,  required this.hintText, required this.labelText });
  final TextEditingController txtController;
  final String  hintText;
  final String labelText;

  @override
  State<UWTxtPassword> createState() => _UWTxtPasswordState();
}

class _UWTxtPasswordState extends State<UWTxtPassword> {
  bool G_isSecurePassword = true;

  @override
  Widget togglepassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          G_isSecurePassword = !G_isSecurePassword;
        });
      },
      icon: G_isSecurePassword
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      color: Colors.indigo,
    );
  }
  Widget build(BuildContext context) {
    bool G_isSecurePassword = true;


    return  TextFormField(
      obscureText: G_isSecurePassword,
      controller: widget.txtController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.black),
        labelText: widget.labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
            const BorderSide(color: Colors.white38)),
        prefixIcon: const Icon(MdiIcons.fingerprint,
            size: 20, color: Colors.indigo),
        suffixIcon: togglepassword(),
      ),
    );
  }
}



