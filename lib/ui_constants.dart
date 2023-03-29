import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomColors {
  static Color orange = const Color(0xFFFF5524);
  static Color brownish = const Color(0xFF989185);
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color gray = const Color(0xFFEBEBEB);
  static Color darkGray = const Color(0xFF404040);
  static Color anotherGray = const Color(0xFF979797);
  static Color transparentBorder = const Color(0x33FFFFFF);
  static Color transparent = const Color(0x00000000);
}

class CustomFonts {
  static TextStyle baseFont = GoogleFonts.lexend();

  static TextStyle title = baseFont.copyWith(
    fontSize: 26,
    fontWeight: FontWeight.w400,
    letterSpacing: -1,
  );

  static TextStyle topBar = baseFont.copyWith(
    fontSize: 17,
    fontWeight: FontWeight.w300,
    letterSpacing: -1, //  ~ -3% in figma
  );

  static TextStyle body = baseFont.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: -1,
  );
}
