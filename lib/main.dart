
import"package:flutter/material.dart";
import 'package:post_api_sample/screens/sign_up_screen/sign_up.dart';
import 'screens/home_screen/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown
      ),
      home: const SignUp(),
    );
  }
}



