import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UWIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  const UWIconButton({
    Key? key,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.lightBlue.shade300,
              Colors.lightBlue.shade400,
              Colors.lightBlueAccent.shade400,
              Colors.lightBlueAccent.shade400,
              //add more colors
            ]),
            borderRadius: BorderRadius.circular(4),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5.0) //blur radius of shadow
            ]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan
            //make color or elevated button transparent
          ),
          onPressed: onTap,
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.add_circle,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: text,
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: .5)),
                ),
              ],
            ),
          ),
        ));
  }
}
