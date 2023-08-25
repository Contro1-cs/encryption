import 'package:encryption/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

algoButton(context, String title, void Function()? onPressed) {
  return Container(
    height: 50,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    ),
  );
}

encryptButton(context, void Function()? onPressed) {
  return Container(
    height: 50,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      onPressed: onPressed,
      child: Text(
        'Encrypt',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    ),
  );
}
