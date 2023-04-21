import 'package:api_bloc/bloc/user.state.dart';
import 'package:api_bloc/bloc/user_bloc.dart';
import 'package:api_bloc/bloc/user_event.dart';
import 'package:api_bloc/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    _userBloc.add(GetUserList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Flutter"),
        backgroundColor: Colors.teal,
      ),
      body: _buildListUser(),
    );
  }

  Widget _buildListUser() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (context) => _userBloc,
          child: BlocBuilder<UserBloc,UserState>(
            builder: (context, state) {
              if (state is UserError) {
                return Center(
                  child: Text(state.error!),
                );
              } else if (state is UserInital) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserLoaded) {
                return ListView.builder(
                  itemCount: state.userList.length,
                  itemBuilder: (context, index) {
                    UserModel userModel = state.userList[index];
                    return ListTile(
                      title: Text(userModel.title.toString()),
                      subtitle: Text(userModel.id.toString()),
                      trailing: Text(userModel.userId.toString()),
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
