import 'package:flutter/material.dart';
import 'package:post_api_sample/screens/login_screen/login_screen.dart';

import 'components/body.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Login()));
              },
              icon: const Icon(Icons.login))
        ],
      ),
      body: const Body(),
    );
  }
}
