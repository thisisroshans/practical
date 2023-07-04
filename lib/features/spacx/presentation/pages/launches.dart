import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_tdd/features/spacx/data/models/launches_model.dart';
import 'package:practical_tdd/features/spacx/domain/repositories/launches_repository.dart';
import '../blocs/launches/launches_bloc.dart';

class LaunchesPage extends StatelessWidget
{

  const LaunchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => LaunchesBloc(
        RepositoryProvider.of<LaunchesRepository>(context),
      )..add(LaunchesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Launches"),

        ),
        body: BlocBuilder<LaunchesBloc,LaunchesState>(
          builder: (context,state){
            if (state is LaunchesInitial)
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is LaunchesLoadedState)
            {
              List<LaunchesModel> allLaunches= state.launches;
              return ListView.builder(
                itemCount: allLaunches.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(allLaunches[index].missionName,style:
                      const TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                  );
                });
            }
            return Container();
          },
        ),
      ),
    );
  }



}