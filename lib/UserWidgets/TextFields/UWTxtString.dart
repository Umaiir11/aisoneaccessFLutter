import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UWTxtString extends StatelessWidget {

   final TextEditingController txtController = new TextEditingController();
  late final String  hintText;
  late final String labelText;

  String get TxtHintText {
    return hintText;
  }
  void set TxtHintText(String text) {
    hintText = text;
  }

  String get TxtLabelText {
    return labelText;
  }
  void set TxtLabelText(String text) {
    labelText = text;
  }



  @override

  Widget build(BuildContext context) {
    return  TextFormField(
      controller: txtController,
      decoration: InputDecoration(
        hintText: TxtHintText,
        hintStyle: const TextStyle(color: Colors.black26),
        labelText: TxtLabelText,
        floatingLabelBehavior:
        FloatingLabelBehavior.always,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
            const BorderSide(color: Colors.white38)),
        prefixIcon: const Icon(MdiIcons.accountHardHat,
            size: 20, color: Colors.indigo),
      ),
    );
  }






}
