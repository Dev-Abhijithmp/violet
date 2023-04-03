import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:violet/homepage.dart';
import 'package:violet/provider/homeprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'violet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
          builder: (context, child) => const Homepage(),
        )
      ]),
    );
  }
}
