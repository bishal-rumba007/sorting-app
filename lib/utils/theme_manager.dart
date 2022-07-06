import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sorting_app/utils/colors.dart';


ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColor,
    useMaterial3: true,
    /// main colors of the app
    primaryColor: kPinkColor,
    primaryColorLight: kGreenColor,
    disabledColor: kGreenishColor.withOpacity(0.6),

    colorScheme: ColorScheme.fromSeed(seedColor: kGreenishColor),

    /// ripple color
    splashColor: kPurpleColor,
    /// will be used incase of disabled button for example
    hintColor: kPurpleColor,

    /// card view theme
    cardTheme: CardTheme(
      color: kCardColor,
      shadowColor: Colors.black.withOpacity(0.25),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r)
      )
    ),

    ///App bar theme
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: kDefaultIconDarkColor, // Set the color of the back arrow here
      ),
      backgroundColor: kBackgroundColor,
      elevation: 5,
      shadowColor: Colors.black.withOpacity(0.25),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),


    /// Button theme
    buttonTheme: ButtonThemeData(
      shape: const RoundedRectangleBorder(),
      disabledColor: kGreenishColor.withOpacity(0.6),
      buttonColor: kPinkColor,
    ),

    snackBarTheme: const SnackBarThemeData(
      backgroundColor: kGreenColor,
      contentTextStyle: TextStyle(color: Colors.white, fontSize: 14),
    ),

    /// elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        elevation: 0,
        textStyle: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
        foregroundColor: Colors.white,
        backgroundColor: kPinkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),


    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kPinkColor,
      foregroundColor: Colors.white,
    ),

    /// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      /// hint style
      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14.sp),

      /// label style
      labelStyle: const TextStyle(color: Colors.black, fontSize: 12),

      /// floating lable style
      floatingLabelStyle: const TextStyle(color: Colors.pink, fontSize: 12),

      /// error style
      errorStyle: const TextStyle(color: Colors.red, fontSize: 12),

      /// enabled border
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: kPinkColor,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),

      /// focused border
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: kPinkColor,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),

      // error border
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      // focused error border
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    ),
  );
}