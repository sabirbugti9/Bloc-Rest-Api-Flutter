import 'package:api_bloc/model/user_model.dart';
import 'package:api_bloc/resource/api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<UserModel>> fetchUsersList() {
    return _apiProvider.fetchUsersList();
  }
}

class NetworkError extends Error {}
