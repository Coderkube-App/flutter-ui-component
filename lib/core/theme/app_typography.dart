import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A central repository for all typography styles used in the application.
class AppTypography {
  static TextStyle get h1 => GoogleFonts.outfit(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static TextStyle get h2 => GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static TextStyle get h3 =>
      GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w600);

  static TextStyle get bodyLarge =>
      GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle get bodyMedium =>
      GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal);

  static TextStyle get bodySmall =>
      GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal);

  static TextStyle get labelLarge => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    textStyle: const TextStyle(letterSpacing: 1.25),
  );
}
