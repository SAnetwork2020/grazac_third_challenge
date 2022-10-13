// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import '../../services.dart';
// import 'package:http/http.dart' as http;
//
// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);
//
//   @override
//   State<Body> createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> {
//   Map data = {};
//   List items = [];
//
//   Future getItems() async {
//     // http.Response response = await http.get(url, headers: headers);
//     // data = json.decode(response.body);
//     setState(() {
//       items = data["fetchItems"];
//     });
//     debugPrint(items.toString());
//   }
//   @override
//   void initState() {
//     getItems();
//     // Future.delayed(Duration(seconds: 0)).then((value) {
//     //   KwiloxProvider().fetchData();
//     // });
//     super.initState();
//   }
//
//   @override
// Widget build(BuildContext context) {
//   return Column(
//     children: [
//       Flexible(
//         child:
//           ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, int index) {
//                 return InkWell(
//                   onTap: (){},
//                   child: Card(
//                       color: Colors.grey.shade50,
//                       child: Padding(
//                         padding: const EdgeInsets.all(18.0),
//                         child: ListTile(
//                           title: Text(
//                             "${items[index]["name"]}",
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.deepOrange,
//                                 fontSize: 20),
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   const Text(
//                                     "Quantity Available:",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16),
//                                   ),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   Container(
//                                     width: 20,
//                                     decoration: const BoxDecoration(
//                                         // borderRadius: BorderRadius.circular(30),
//                                         shape: BoxShape.circle,
//                                         color: Colors.red),
//                                     child: Center(
//                                       child: Text(
//                                         "${items[index]["quantityAvailable"]}",
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white,
//                                             fontSize: 16),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               Text(
//                                 "${items[index]["manufacturerCompany"]}",
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 16),
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               Text(
//                                 "${items[index]["name"]}",
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 16),
//                               ),
//
//                             ],
//                           ),
//                         ),
//                       )),
//                 );
//               }),
//         ),
//     ],
//   );
//   // return FutureBuilder<FetchItems>(
//   //   future: fetchData(),
//   //     builder: (context,snapshot){
//   //     if (snapshot.hasData){
//   //       return Expanded(
//   //         child: ListView.builder(
//   //             itemCount: snapshot.data!.itemsForListing!.length,
//   //             itemBuilder: (context, i){
//   //               var data = snapshot.data!;
//   //               print(data.itemsForListing);
//   //               return Container(
//   //                 margin: const EdgeInsets.symmetric(vertical: 20),
//   //                 width:  200, color: Colors.white,
//   //                   child: ListTile(
//   //                     title: Text(data.itemsForListing![i].name),
//   //                     subtitle: Column(
//   //                       children: [
//   //                         Text(data.itemsForListing![i].itemName),
//   //                         Text(data.itemsForListing![i].quantityAvailable.toString()),
//   //                         Text(data.itemsForListing![i].manufacturerCompany),
//   //                         Text(data.itemsForListing![i].createdAt),
//   //                       ],
//   //                     ),
//   //                   ),
//   //               );
//   //             }
//   //         ),
//   //       );
//   //     }else if(snapshot.hasError){
//   //       return Center(child: Padding(
//   //         padding: const EdgeInsets.symmetric(horizontal: 40.0),
//   //         child: Text("${snapshot.error}",style: const TextStyle(
//   //           fontSize: 24, fontWeight: FontWeight.w800
//   //         ),),
//   //       ));
//   //     }
//   //     return Center(child: const CircularProgressIndicator());
//   //     }
//   // );
// }}