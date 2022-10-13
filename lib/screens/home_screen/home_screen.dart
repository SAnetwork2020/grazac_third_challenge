import 'package:flutter/material.dart';
import 'package:post_api_sample/screens/login_screen/login_screen.dart';

import 'components/body.dart';
import 'components/body2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => const Login()));
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: const Body(),
    );
  }
}
