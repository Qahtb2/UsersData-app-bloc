import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc2/Models/data_model.dart';
import 'package:project_bloc2/blocs/app_states.dart';
import 'package:project_bloc2/blocs/app_events.dart';
import 'package:project_bloc2/backend_api/users_repository.dart';
import 'package:project_bloc2/blocs/app_blocs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => UserBloc(UserRepository()),
        )
      ],
      child: Scaffold(
        appBar: AppBar(title:  const Text('Users Data'),),
        body: BlocProvider(
          create: (context)=> UserBloc(UserRepository())..add(LoadUserEvent()),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state){
              if(state is UserLoadingState){
                return const Center(child: CircularProgressIndicator(),);
              }
              if (state is UserErrorState) {
                return Center(
                  child: Text('Error: ${state.error}'),
                );
              }

              if(state is UserLoadedState){
                //  return const Center(child: Text('Loaded state '),);
                List<DataModel> userList = state.users;
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (_,index){
                      return Container(
                        padding:  const EdgeInsets.symmetric(vertical: 3,horizontal: 7),
                        child: Card(
                          color: Colors.amber,
                          child: ListTile(
                            title: Text('${userList[index].firstName} - ${userList[index].lastName}'
                              ,style: const TextStyle(color: Colors.deepPurple),),
                            subtitle: Text('${userList[index].maidenName}'
                              ,style: const TextStyle(color: Colors.deepPurple),),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(userList[index].image.toString()),
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
              // هذا هو الـ fallback في حال لم تكن الحالة UserLoadedState.
              return Container();
            //   or return const Center(child: Text('No data loaded.'));
            },
          ),
        ),
      ),
    );
  }
}