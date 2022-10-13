import 'package:post_api_sample/screens/models/create_user.dart';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart'as http;
import 'screens/models/kwilxo_model.dart';
import 'screens/services.dart';

final userProvider = Provider<ApiServices>((ref)=>ApiServices());
final userDataProvider = FutureProvider<List<FetchItems>>((ref)async{
  return ref.watch(userProvider).getUsers();
});
