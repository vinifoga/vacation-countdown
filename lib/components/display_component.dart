import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayComponent extends StatelessWidget {
  final String variable;
  final String text;

  const DisplayComponent({Key? key, required this.variable, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            variable,
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: 65,
            ),
          ),
          Text(
            text,
            style: GoogleFonts.robotoMono(color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
