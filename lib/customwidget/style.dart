import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitleStyle {
  static TextStyle customTitleStyle({double? size, Color? color}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle customgoogleStyle({double? size, Color? color}) {
    return GoogleFonts.tangerine(fontSize: 18, fontWeight: FontWeight.w300);
  }

  static TextStyle customgoogleStyle2({double? size, Color? color}) {
    return GoogleFonts.alegreyaSc(
        fontSize: 25,
        letterSpacing: 2,
        color: Colors.black,
        fontWeight: FontWeight.w300);
  }
}
