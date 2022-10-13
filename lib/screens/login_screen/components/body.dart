import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:post_api_sample/screens/home_screen/home_screen.dart';
import 'package:post_api_sample/screens/models/user_login.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Login",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(hintText: "Email Address"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: "Password"),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                postLogin(UserLogin(
                    password: passwordController.text.trim(),
                    email: emailController.text.trim()));
              },
              child: const Text("Log In"),
            ),
          ),
        ],
      ),
    );
  }

  Future<http.Response?> postLogin(UserLogin data) async {
    http.Response? postLoginResponse;
    var url = Uri.parse("https://kwilox.herokuapp.com/api/v1/user-login");
    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "*/*",
    };

    try {
      postLoginResponse = await http.post(url,
          headers: requestHeaders, body: jsonEncode(data.toJson()));
      if (postLoginResponse.statusCode == 200) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
          if(kDebugMode){
            print("Response status: ${postLoginResponse.statusCode}");
            print("Response body: ${postLoginResponse.body}");
            var responseData = jsonDecode(postLoginResponse.body);
            print(responseData);
          }
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
    }
    return postLoginResponse;
  }
}
