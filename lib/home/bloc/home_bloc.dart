
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleapi/services/boredServices.dart';

import 'home_event.dart';
import 'home_state.dart';
class HomeBloc extends Bloc<HomeEvent ,HomeState>{

  final BoredService _boredService ;

  HomeBloc(this._boredService) : super(HomeLoadingState()){
    on<loadApiEvent>((event, emit) async {
        emit(HomeLoadingState());
        final activity = await _boredService.getBoredActivity();
        emit(HomeLoadedState(activity.activity,activity.type, activity.participants));
    });
  }

}