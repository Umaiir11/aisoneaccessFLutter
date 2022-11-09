import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UWButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  const UWButton({
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
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 4.5) //blur radius of shadow
            ]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent.withOpacity(0.58),
            disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
            shadowColor: Colors.transparent,
            //make color or elevated button transparent
          ),
          onPressed: onTap,
          child: Text(text,
              style: GoogleFonts.ubuntu(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      letterSpacing: .5))),
        ));
  }
}
