import 'package:api_bloc/bloc/user.state.dart';
import 'package:api_bloc/bloc/user_event.dart';
import 'package:api_bloc/model/user_model.dart';
import 'package:api_bloc/resource/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInital()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetUserList>((event, emit) async {
      try {
        emit(UserLoading());
        final List<UserModel> userList = await apiRepository.fetchUsersList();
        print(userList.length);
        emit(UserLoaded(userList: userList));
        if (userList[0].error != null) {
          emit(UserError(error: userList[0].error));
        }
      } on NetworkError {
        emit(const UserError(error: "Failed to fetch data is your device online"));
      }
    });
  }
}
