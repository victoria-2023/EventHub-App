import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.amber;
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black;
// Add other colors as needed
}

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    color: AppColors.textColor,
  );
// Define other text styles as needed
}

class AppPadding {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
// Add other padding constants as needed
}

class AppStrings {
  static const String appName = 'EventHub';
  static const String welcomeMessage = 'Welcome to EventHub!';
// Add other string constants as needed
}

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.accentColor,
    backgroundColor: AppColors.backgroundColor,
    textTheme: TextTheme(
      headline1: AppTextStyles.heading,
      bodyText1: AppTextStyles.bodyText,
    ),
    // Define other theme properties
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blueGrey,
    hintColor: Colors.lightBlueAccent,
    backgroundColor: Colors.grey.shade900,
    textTheme: TextTheme(
      headline1: AppTextStyles.heading.copyWith(color: Colors.white),
      bodyText1: AppTextStyles.bodyText.copyWith(color: Colors.white70),
    ),
    // Define other theme properties for dark mode
  );
}
