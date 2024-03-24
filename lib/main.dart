
import 'package:flutter/material.dart';
import 'package:m_boote/home/home_screen.dart';
import 'package:m_boote/themes/custom_theme.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.getTheme(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppData extends ChangeNotifier {
  // Hier kommen Ihre App-Daten hin, die zwischen Widgets geteilt werden sollen
}
