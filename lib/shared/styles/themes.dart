import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/shared/styles/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.mainColor,
        iconTheme: IconThemeData(color: MyColors.whiteColor),
      ),
      tabBarTheme: TabBarTheme(
        //here
      ),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: MyColors.whiteColor),
          bodySmall: GoogleFonts.poppins(
              fontSize: 12,
              color: MyColors.blackColor,
              fontWeight: FontWeight.w400)));

}
