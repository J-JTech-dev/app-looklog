import 'package:flutter/material.dart';

class FontTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      useMaterial3: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      fontFamily: 'Pretendard',
      textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 48.0, color: Color(0XFF222222), fontWeight: FontWeight.w500),
        titleMedium: TextStyle(fontSize: 24.0, color: Color(0XFF202020), fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontSize: 20.0, color:  Color(0XFF222222),fontWeight: FontWeight.w500),

        bodyMedium: TextStyle(fontSize: 16.0, color: Color(0XFF808080), fontWeight: FontWeight.w500),
        bodySmall: TextStyle(fontSize: 14.0, color: Color(0XFFA1A1A1), fontWeight: FontWeight.w500),

        labelLarge: TextStyle(fontSize: 16.0, color: Color(0XFFA1A1A1), fontWeight: FontWeight.w700),
        labelMedium: TextStyle(fontSize: 15.0, color: Color(0xFF222222), fontWeight: FontWeight.w400),
        labelSmall: TextStyle(fontSize: 13.0, color: Color(0xFFFF6F61), fontWeight: FontWeight.w500),
      ),
    );
  }
}