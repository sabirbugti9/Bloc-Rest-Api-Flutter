import 'package:api_bloc/model/user_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio = Dio();

  final String _url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<UserModel>> fetchUsersList() async {
    try {
      Response response = await dio.get(_url);
      List<dynamic> value = response.data;
  print("Hellas");
  
      return value.map((e) => UserModel.fromJson(e)).toList();
  
    } catch (e) {
      print("Hello");
      if (e.toString().contains("SocketException")) {
        return [UserModel.withError("Check your internet connection please")];
      }
      return [UserModel.withError(e.toString())];
    }
  }
}
