import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class surah_tab extends StatelessWidget {
  const surah_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "surah",
        style: GoogleFonts.poppins(fontSize: 15, backgroundColor: Colors.white),
      ),
    );
  }
}
