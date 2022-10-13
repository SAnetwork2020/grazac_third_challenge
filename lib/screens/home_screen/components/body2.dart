import 'package:flutter/material.dart';
import 'package:post_api_sample/data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_api_sample/map_items_class.dart';

import '../../models/kwilxo_model.dart';

class Body extends ConsumerWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Column(
      children: [
        Center(
          child: _data.when(
              data: (_data) {
                List<FetchItems> userList = _data.map((e) => e).toList();
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                  child: SizedBox(height: 600,
                    child: ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                            onTap: () {},
                            child: Card(
                                color: Colors.grey.shade50,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: ListTile(
                                    title: Text(
                                      "${userList[index].name}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange,
                                          fontSize: 20),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "Quantity Available:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Container(
                                              width: 20,
                                              decoration: const BoxDecoration(
                                                  // borderRadius: BorderRadius.circular(30),
                                                  shape: BoxShape.circle,
                                                  color: Colors.red),
                                              child: Center(
                                                child: Text(
                                                  "${userList[index].quantityAvailable}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "${userList[index].manufacturerCompany}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "${userList[index].name}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          );
                        }),
                  ),
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
        )
      ],
    );
  }
}
