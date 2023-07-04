import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_tdd/features/spacx/presentation/pages/launches.dart';

import '../../data/models/launch_history_model.dart';
import '../../domain/repositories/launch_history_repository.dart';
import '../blocs/history/launch_history_bloc.dart';

class Home extends StatelessWidget
{

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => LaunchHistoryBloc(
        RepositoryProvider.of<LaunchHistoryRepository>(context),
      )..add(LoadHistroyEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("spaceX"),
          actions: [
            ElevatedButton.icon(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LaunchesPage(),));
            }, icon: Icon(Icons.flight), label: Text("rockets"),),
          ],
        ),
        body: BlocBuilder<LaunchHistoryBloc,LaunchHistoryState>(
          builder: (context,state){
            if (state is LaunchHistoryInitial)
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is LaunchHistoryLoadedState)
            {
              List<LaunchHistory> allHistory = state.history;
              return ListView.builder(
                itemCount: allHistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(allHistory[index].title,style:
                      const TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                      subtitle: Text(allHistory[index].details,style:
                      const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ),

                  );
                }

                ,);
            }
            return Container();
          },
        ),
      ),
    );
  }

}