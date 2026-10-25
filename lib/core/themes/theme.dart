import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimens.dart';

abstract final class AppTextStyles {
  static const fontFamily = 'GolosText';
  static const logo = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36,
    height: 1,
    letterSpacing: -2,
    fontWeight: FontWeight.w900,
    color: AppColors.onBrand,
  );
  static const hero = TextStyle(
    fontFamily: fontFamily,
    fontSize: 60,
    height: .99,
    letterSpacing: -4,
    fontWeight: FontWeight.w800,
  );
  static const title = TextStyle(
    fontFamily: fontFamily,
    fontSize: 45,
    height: 1.08,
    letterSpacing: -2.5,
    fontWeight: FontWeight.w800,
    color: AppColors.ink,
  );
  static const productTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 29,
    height: 1.13,
    letterSpacing: -1,
    fontWeight: FontWeight.w600,
    color: AppColors.ink,
  );
  static const heading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1.25,
    letterSpacing: -.8,
    fontWeight: FontWeight.w600,
    color: AppColors.ink,
  );
  static const body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.5,
    color: AppColors.ink,
  );
  static const secondary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.6,
    color: AppColors.muted,
  );
  static const label = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    height: 1.5,
    color: AppColors.ink,
  );
  static const eyebrow = TextStyle(
    fontFamily: fontFamily,
    fontSize: 9,
    height: 1.5,
    letterSpacing: 1.7,
    fontWeight: FontWeight.w600,
    color: AppColors.ink,
  );
  static const price = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    height: 1.3,
    fontWeight: FontWeight.w700,
    color: AppColors.richPurplishRedColor,
  );
  static final productCategory = eyebrow.copyWith(
    fontSize: 8,
    color: AppColors.richPurplishRedColor,
  );
  static final detailTitle = productTitle.copyWith(
    fontSize: 28,
    height: 1.2,
    fontWeight: FontWeight.w700,
  );
  static final detailPrice = price.copyWith(fontSize: 24);
  static final detailDescription = secondary.copyWith(
    fontSize: 13,
    height: 1.8,
  );
  static final listPrice = button.copyWith(
    color: AppColors.richPurplishRedColor,
    fontWeight: FontWeight.w700,
  );
  static const pagerCaption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 9,
    color: AppColors.muted,
  );
  static const button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );
}

ThemeData appTheme() {
  final scheme = ColorScheme.fromSeed(seedColor: AppColors.richPurplishRedColor)
      .copyWith(
        primary: AppColors.richPurplishRedColor,
        onPrimary: AppColors.onBrand,
        surface: AppColors.background,
        onSurface: AppColors.ink,
        outline: AppColors.border,
      );
  return ThemeData(
    useMaterial3: true,
    fontFamily: AppTextStyles.fontFamily,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: scheme,
    textTheme: const TextTheme(
      bodyMedium: AppTextStyles.body,
      headlineLarge: AppTextStyles.title,
      titleLarge: AppTextStyles.heading,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.richPurplishRedColor,
      foregroundColor: AppColors.onBrand,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: AppTextStyles.secondary,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimens.spaceLg,
        vertical: AppDimens.spaceMd,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusPill),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusPill),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusPill),
        borderSide: const BorderSide(color: AppColors.richPurplishRedColor),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, AppDimens.buttonHeight),
        textStyle: AppTextStyles.button,
        shape: const StadiumBorder(),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.ink,
        side: const BorderSide(color: AppColors.border),
        minimumSize: const Size(0, AppDimens.buttonHeight),
        textStyle: AppTextStyles.button,
        shape: const StadiumBorder(),
      ),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.border, thickness: 1),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimens.radiusCard),
        ),
      ),
    ),
  );
}
