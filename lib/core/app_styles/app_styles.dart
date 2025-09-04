import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle bodyExtraSmall(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 8,
        fontWeight: weight ?? FontWeight.w400,
        color: color ?? AppColors.whiteColor,
        letterSpacing: 0.2,
      );

  static TextStyle bodySmall(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 10,
        fontWeight: weight ?? FontWeight.w400,
        color: color ?? AppColors.colorGreyWhite,
        letterSpacing: 0.2,
      );

  static TextStyle bodyMedium(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 12,
        fontWeight: weight ?? FontWeight.w400,
        color: color ?? AppColors.colorGreyWhite,
        letterSpacing: 0.1,
      );
  static TextStyle bodyLarge(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 13,
        fontWeight: weight ?? FontWeight.w600,
        color: color ?? AppColors.whiteColor,
        letterSpacing: 0.15,
      );

  static TextStyle labelSmall(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 9,
        fontWeight: weight ?? FontWeight.w500,
        color: color ?? AppColors.colorGreyWhite,
        letterSpacing: 0.5,
      );

  static TextStyle labelMedium(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 9,
        fontWeight: weight ?? FontWeight.w500,
        color: color ?? AppColors.whiteColor,
        letterSpacing: 0.5,
      );

  static TextStyle labelLarge(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 12,
        fontWeight: weight ?? FontWeight.w600,
        color: color ?? AppColors.colorGreyWhite,
        letterSpacing: 0.1,
      );

  static TextStyle titleSmall(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 9,
        fontWeight: weight ?? FontWeight.w400,
        color: color ?? AppColors.colorGreyWhite,
        letterSpacing: 0.1,
      );

  static TextStyle titleMedium(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 12,
        fontWeight: weight ?? FontWeight.w600,
        color: color ?? AppColors.whiteColor,
        letterSpacing: 0.1,
      );

  static TextStyle titleLarge(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 20,
        fontWeight: weight ?? FontWeight.w800,
        color: color ?? AppColors.whiteColor,
        letterSpacing: 0,
      );

  static TextStyle headlineSmall(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 22,
        fontWeight: weight ?? FontWeight.w400,
        color: color ?? AppColors.colorGreyWhite,
        letterSpacing: 0,
      );

  static TextStyle headlineMedium(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 26,
        fontWeight: weight ?? FontWeight.w400,
        color: color ?? AppColors.colorGreyWhite,
        letterSpacing: 0,
      );

  static TextStyle headlineLarge(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 30,
        fontWeight: weight ?? FontWeight.w400,
        color: color ?? AppColors.colorGreyWhite,
        letterSpacing: 0,
      );

  static TextStyle displaySmall(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 34,
        fontWeight: weight ?? FontWeight.w500,
        color: color ?? AppColors.whiteColor,
        letterSpacing: 0,
      );

  static TextStyle displayMedium(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 43,
        fontWeight: weight ?? FontWeight.w500,
        color: color ?? AppColors.whiteColor,
        letterSpacing: 0,
      );

  static TextStyle displayLarge(
          {Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 55,
        fontWeight: weight ?? FontWeight.w500,
        color: color ?? AppColors.whiteColor,
        letterSpacing: 0,
      );
}
