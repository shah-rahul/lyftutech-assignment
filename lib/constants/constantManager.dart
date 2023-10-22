import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStrings {
  static const String apiUrl = "https://api.escuelajs.co/api/v1/products";
}

class DecorationManager {
  static Decoration boxDecoration = BoxDecoration(
    color: Color(0xFFE0E0E0), // Use the desired background color
    borderRadius: BorderRadius.circular(12.0), // Set the border radius
    boxShadow: const [
      BoxShadow(
        color: Color(0xFFBEBEBE),
        offset: Offset(20, 20),
        blurRadius: 60,
      ),
      BoxShadow(
        color: Color(0xFFFFFFFF),
        offset: Offset(-20, -20),
        blurRadius: 60,
      ),
    ],
  );
}

class FontManager {
  static TextStyle heading = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
  //subheading
  static TextStyle subheading = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  );
}
