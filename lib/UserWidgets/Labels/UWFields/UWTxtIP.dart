import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UWTxtIP extends StatelessWidget {
  late final TextEditingController txtController = new TextEditingController();
  late final String hintText;
  late final String labelText;

  String get TxtHintText {
    return hintText;
  }
  void set TxtHintText(String lhintText) {
    hintText = lhintText;
  }

  String get TxtLabelText {
    return labelText;
  }
  void set TxtLabelText(String l_labelText) {
    labelText = l_labelText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: txtController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: TxtHintText,
        hintStyle: const TextStyle(color: Colors.black26),
        labelText: TxtLabelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.white38)),
        prefixIcon:
            const Icon(MdiIcons.ipNetwork, size: 20, color: Colors.indigo),
      ),
    );
  }
}
