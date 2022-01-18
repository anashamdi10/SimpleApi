import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleapi/home/bloc/home_bloc.dart';
import 'package:sampleapi/home/bloc/home_state.dart';
import 'package:sampleapi/services/boredServices.dart';

import 'bloc/home_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<BoredService>(context),
      )..add(loadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Activities for bored people'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Column(
                children: [
                  Text(state.activityName),
                  Text(state.activityType),
                  Text(state.perticipants.toString()),
                  ElevatedButton(
                      onPressed: () => BlocProvider.of<HomeBloc>(context)
                          .add(loadApiEvent()),
                      child: Text("load next"))
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
