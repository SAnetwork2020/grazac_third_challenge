import 'package:riverpod/riverpod.dart';

import 'map_items_class.dart';
import 'screens/models/kwilxo_model.dart';
import 'screens/services.dart';

final userProvider = Provider<ApiServices>((ref)=>ApiServices());
final userDataProvider = FutureProvider<List<FetchItems>>((ref)async{
  // return ref.watch(userProvider).getUsers();
  return ref.watch(userProvider).getUsers();
});