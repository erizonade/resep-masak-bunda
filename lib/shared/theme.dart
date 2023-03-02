import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color colorBackground = Color(0XFF262626);
Color colorBlack = Color(0XFF000000);
Color colorGreen = Color(0XFFC3EE8D);
Color colorYellow = Color(0XFFEAEC8D);
Color colorWhite = Color(0XFFFFFFFF);
Color colorGrey = Color(0XFF979797);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: colorWhite,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: colorGrey,
);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: colorBlack,
);

FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight black = FontWeight.w900;

Center circularProgressIndicator = const Center(
  child: CircularProgressIndicator(
    backgroundColor: Color(0XFFEAEC8D),
    valueColor: AlwaysStoppedAnimation(Color(0XFFC3EE8D)),
    strokeWidth: 5,
  ),
);
