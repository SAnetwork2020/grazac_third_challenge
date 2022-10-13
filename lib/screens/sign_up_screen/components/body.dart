import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:post_api_sample/screens/home_screen/home_screen.dart';
import 'package:post_api_sample/screens/models/create_user.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: SingleChildScrollView(
        child: isLoading? Center(child: CircularProgressIndicator(),) :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sign Up",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: firstnameController,
              decoration: const InputDecoration(hintText: "First Name"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: lastnameController,
              decoration: const InputDecoration(hintText: "Last Name"),
            ),
            const SizedBox(
              height: 20,
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
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(hintText: "Age"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(hintText: "Phone Number"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  postRegister(UserSignUp(
                          password: passwordController.text.trim(),
                          email: emailController.text.trim(),
                          age: int.parse(ageController.text.trim()),
                          firstname: firstnameController.text.trim(),
                          lastname: lastnameController.text.trim(),
                          phonenumber: phoneController.text.trim()
                      ));
                },
                child: const Text("Sign Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<http.Response?> postRegister(UserSignUp data) async {
    http.Response? postRegisterResponse;
    var url = Uri.parse("https://kwilox.herokuapp.com/api/v1/register-user");
    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "*/*",
    };
    setState(() {
      isLoading = true;
    });
    try {
      postRegisterResponse = await http.post(url,
          headers: requestHeaders, body: jsonEncode(data.toJson()));
      if (postRegisterResponse.statusCode == 201) {
        setState(() {
          isLoading = false;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        if(kDebugMode){
          print("Response status: ${postRegisterResponse.statusCode}");
          print("Response body: ${postRegisterResponse.body}");
          var responseData = jsonDecode(postRegisterResponse.body);
          print(responseData);
        }
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
    }
    setState(() {
      isLoading = false;
    });
    return postRegisterResponse;
  }

  // Future<http.Response?> postRegister(UserSignUp data) async {
  //   http.Response? postRegisterResponse;
  //   var url = Uri.parse("https://kwilox.herokuapp.com/api/v1/register-user");
  //   Map<String, String> requestHeaders = {
  //     "Content-type": "application/json",
  //     "Accept": "*/*"
  //   };
  //
  //   try {
  //     postRegisterResponse = await http.post(url,
  //         headers: requestHeaders, body: jsonEncode(data.toJson()));
  //     if (postRegisterResponse.statusCode == 200); Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  //       if (kDebugMode) {
  //         print("Response status: ${postRegisterResponse.statusCode}");
  //         print("Response body: ${postRegisterResponse.body}");
  //
  //       var responseData = jsonDecode(postRegisterResponse.body);
  //       if (kDebugMode) {
  //         print(responseData);
  //       }
  //     }
  //   } catch (e, s) {
  //     if (kDebugMode) {
  //       print(e);
  //       print(s);
  //     }
  //   }
  //   return postRegisterResponse;
  // }
}
