import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
import 'package:post_api_sample/screens/models/kwilxo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/create_user.dart';
import 'models/items_modification.dart';


// Future<FetchItems> fetchData() async {
//   try {
//     var response = await http.get(url, headers: headers);
//     print("Response status: ${response.statusCode}");
//     var responseData = FetchItems.fromJson(jsonDecode(response.body));
//     print(responseData);
//     var data = jsonDecode(response.body);
//     print("what are you:${data["data"][0]["name"]}");
//     return responseData;
//   } catch (e) {
//     throw Exception("Something went wrong:$e");
//   }
// }
//
// var url = Uri.parse("https://kwilox.herokuapp.com/api/v1/fetch-items");
// Map<String, String> headers = {
//   "Content-type": "application/json",
//   "Accept": "*/*",
// };
// class KwiloxProvider extends ChangeNotifier {
//
//   List kwilox = <KwiloxModel>[];
//
//   // var token =
//   // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTM3YWM2YmNmNjgyMGU3MGE2Yjg4YyIsImVtYWlsIjoidGVtaXRvcGVvYmFzYUBnbWFpbC5jb20iLCJyb2xlIjoiVXNlciIsImlhdCI6MTY2NTUzMTgyNSwiZXhwIjoxNjY1NTM5MDI1fQ.MpLvG90aMOI97L4P4kcTZ7JTgutk5I_rgMFttSXCOgo";
//   Map<String, String> headers = {
//     "Content-type": "application/json; charset=utf-8",
//     "Accept": "*/*",
//     "Authorization": "Bearer",
//   };
//   Future<KwiloxModel?> fetchData() async {
//     http.Response? getFetchData;
//     var url = Uri.parse("https://kwilox.herokuapp.com/api/v1/fetch-items");
//     Map<String, String> requestHeaders = {
//       "Content-type": "application/json",
//       "Accept": "*/*",
//     };
//
//     try {
//       getFetchData = await http.get(url, headers: requestHeaders);
//       if (getFetchData.statusCode == 200) {
//         print("Response status: ${getFetchData.statusCode}");
//         print("Response body: ${getFetchData.body}");
//         var responseData = KwiloxModel.fromJson(jsonDecode(getFetchData.body));
//         kwilox.clear();
//         kwilox.add(responseData);
//         print(responseData);
//         notifyListeners();
//         return responseData;
//       } else {
//         throw Exception("Something is wrong");
//       }
//     } catch (e, s) {
//       print(e);
//       print(s);
//     }
//   }
//
// }
class ApiServices{
  String endpoint = "https://kwilox.herokuapp.com/api/v1/fetch-items";
  Future<http.Response?> postRegister(UserSignUp data) async {
    http.Response? postRegisterResponse;
    var url = Uri.parse("https://kwilox.herokuapp.com/api/v1/register-user");
    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "*/*"
    };

    try {
      postRegisterResponse = await http.post(url,
          headers: requestHeaders, body: jsonEncode(data.toJson()));
      if (kDebugMode) {
        print("Response status: ${postRegisterResponse.statusCode}");
        print("Response body: ${postRegisterResponse.body}");
      }
      var responseData = jsonDecode(postRegisterResponse.body);
      if (kDebugMode) {
        print(responseData);
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
    }
    return postRegisterResponse;
  }

  Future<List<FetchItems>>getUsers()async{
    http.Response response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200){
      final List result = jsonDecode(response.body)["fetchItems"];
      return result.map(((e)=> FetchItems.fromJson(e))).toList();
    }else{
    throw Exception(response.reasonPhrase);
    }
  }
}


