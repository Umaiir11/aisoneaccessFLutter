import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UWLabels extends StatelessWidget {
  UWLabels({required this.text, required this.l_FontSize,required this.color });

  final String text;
  final double l_FontSize;
  final Color color;



  @override
  Widget build(BuildContext context) {
    TextStyle l_TestStyle = TextStyle(
        fontSize: l_FontSize,
        color: color,
        fontWeight: FontWeight.w600,
        letterSpacing: .5);

    return Text(text,
        style: GoogleFonts.ubuntu(
          textStyle: l_TestStyle,
        ));
  }
}
