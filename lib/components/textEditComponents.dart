import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container textEditButtons({required String buttonType}) {
  return Container(
    height: 70,
    width: 150,
    margin: EdgeInsets.only(bottom: 10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Color(0xff1D2539),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 5))
        ]),
    child: Text(
      buttonType,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
