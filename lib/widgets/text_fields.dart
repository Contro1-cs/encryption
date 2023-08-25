import 'package:encryption/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

encryptTextField(context,String hint ,TextEditingController controller) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    width: MediaQuery.of(context).size.width,
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      controller: controller,
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      cursorColor: red,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          color: Colors.grey[700],
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: red, width: 2),
        ),
      ),
    ),
  );
}
