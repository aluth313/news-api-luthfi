import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Color kBlackColor = const Color(0xff1F1449);
Color kGreyColor = const Color(0xff9698A9);
Color kGreyBackgroundAvatarColor = const Color(0xffF0F0F0);
Color kGreyOutlineColor = const Color(0xffF2F2F2);
Color kWhiteColor = const Color(0xffFFFFFF);
Color kBlueColor = Colors.blue;

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

convertDate(String convert) {
  DateTime dt = DateTime.parse(convert);
  return DateFormat('dd-MM-yyyy').format(dt);
}
