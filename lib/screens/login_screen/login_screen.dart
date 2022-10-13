import 'package:flutter/material.dart';
import 'package:post_api_sample/screens/sign_up_screen/sign_up.dart';

import 'components/body.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const SignUp()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Body(),
    );
  }
}
