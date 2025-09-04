import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meal_app/pages/home_page.dart';
import 'config/ui_config/ui_config.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/app_styles/app_colors.dart';
import 'core/app_styles/app_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('storageBox');
  runApp(MyApp());
  UiConfig.systemUiConfig();
}

class MyApp extends StatelessWidget {
  final MaterialColor? primaryColor;
  const MyApp({super.key, this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bgColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.bgColor,
          elevation: 0,
          titleTextStyle: AppStyles.labelLarge(color: AppColors.whiteColor,
          size: 16),
          iconTheme: IconThemeData(color: AppColors.whiteColor),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryColor,
          surface: AppColors.bgColor,
          background: AppColors.bgColor,
          onPrimary: AppColors.whiteColor,
          onSurface: AppColors.whiteColor,
          onBackground: AppColors.whiteColor,
        ),
      ),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1.0)),
        child: child!,
      ),
      home: const HomePage(),
    );
  }
}