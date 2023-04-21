import 'package:api_bloc/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserInital extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserModel> userList;
  const UserLoaded({required this.userList});
}

class UserError extends UserState {
  final String? error;
  const UserError({required this.error});
}
