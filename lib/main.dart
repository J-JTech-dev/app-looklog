import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'common/theme/font_theme.dart';
import 'core/config/app_config.dart';
import 'main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  // await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOOKLOG',
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          AppConfig.init(context); // 초기화
          return const MainApp();
        },
      ),
    );
  }
}
