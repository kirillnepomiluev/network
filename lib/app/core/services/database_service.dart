
import 'package:network_app/app/credentials/supabase_credentials.dart';

class DatabaseService {
  Future<dynamic> fetchToDo() async {
    try {
      final response = await SupabaseCredentials.supabaseClient.from('tododb').select();
      print('fetched type - ${response.runtimeType}');
      return response;
    } catch (error) {
      print('fetch error - $error');
    }
  }


  Future addToDo({
    required String title,
    required String description,
  }) async {
    try {
      final response = await SupabaseCredentials.supabaseClient.from('tododb').insert(
          {
            'title' : title,
            'description' : description,
          });
      print('addToDo - $response');
    } catch (error) {
      print('addToDo error - $error');
    }
  }


}
