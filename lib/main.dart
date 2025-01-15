import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Perplexity clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          textTheme: GoogleFonts.interTextTheme(
            ThemeData.dark().textTheme.copyWith(
                  bodyMedium: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textGrey,
                  ),
                ),
          ),
        ),
        home: const HomePage());
  }
}
