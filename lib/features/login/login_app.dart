import 'package:app_looklog/features/login/view/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/theme/font_theme.dart';

class LoginApp extends ConsumerStatefulWidget {
  const LoginApp({super.key});

  @override
  ConsumerState<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends ConsumerState<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FontTheme.themeData(context),
      home: LoginScreen(),
    );
  }
}
