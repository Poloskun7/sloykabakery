import 'package:flutter/material.dart';

class AppColors {
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color greyColor_1 = Color.fromARGB(250, 97, 95, 95);
  static const Color greyColor_2 = Color.fromARGB(250, 118, 108, 108);
  static const Color richPurplishRedColor = Color.fromARGB(255, 186, 38, 72);
  static const Color containerColor = Color.fromARGB(255, 233, 231, 217);
  static const Color dividerColor = Color.fromARGB(255, 194, 194, 194);
}

class AppFontWeights {
  static const FontWeight bolt = FontWeight.bold;
}

class AppFontSizes {
  static const double impressive = 36;
  static const double big = 26;
  static const double giant = 22;
  static const double large = 20;
  static const double medium = 16;
  static const double small = 14;
}

class AppFontStyles {
  
}

class AppTextStyles {
  static const TextStyle logo = TextStyle(
      color: AppColors.richPurplishRedColor,
      fontSize: AppFontSizes.impressive,
      fontWeight: AppFontWeights.bolt);
  static const TextStyle heading_1 = TextStyle(
      color: AppColors.blackColor,
      fontSize: AppFontSizes.big,
      fontWeight: AppFontWeights.bolt);
  static const TextStyle heading_2 = TextStyle(
      color: AppColors.blackColor,
      fontSize: AppFontSizes.giant,
      fontWeight: AppFontWeights.bolt);
  static const TextStyle heading_3 = TextStyle(
      color: AppColors.blackColor,
      fontSize: AppFontSizes.large,
      fontWeight: AppFontWeights.bolt);
  static const TextStyle standart_1 =
      TextStyle(color: AppColors.blackColor, fontSize: AppFontSizes.medium);
  static const TextStyle standart_2 =
      TextStyle(color: AppColors.greyColor_2, fontSize: AppFontSizes.medium);
  static const TextStyle button =
      TextStyle(color: AppColors.whiteColor, fontSize: AppFontSizes.medium);
  static const TextStyle comment =
      TextStyle(color: AppColors.greyColor_1, fontSize: AppFontSizes.small);
}

ThemeData appTheme() {
  return ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.richPurplishRedColor,
      unselectedItemColor: AppColors.greyColor_1,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      surface: Colors.transparent,
    ),
  );
}

class BackgroundColorWidget extends StatelessWidget {
  final Widget? child;
  const BackgroundColorWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFFEFEFE),
                Color(0xFFFDF7ED),
                Color(0xFFFBEFDC),
              ],
              stops: [0.0, 0.3514, 1.0],
            ),
      ),
      child: child ?? child,
    );
  }
}
