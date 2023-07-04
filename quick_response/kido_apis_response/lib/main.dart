import 'package:flutter/material.dart';
import 'package:kido_apis_response/quick_response/All/ex_provider.dart';
import 'package:kido_apis_response/quick_response/All/ex_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AllQuickResponseProvider())
      ],
      child: const MaterialApp(
        home: AllResponseScreen(),
      ),
    );
  }
}
