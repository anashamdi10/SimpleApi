
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{
  const HomeState();
}

class HomeLoadingState extends HomeState {


  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState{

  final String activityName ;
  final String activityType ;
  final int perticipants ;

  const HomeLoadedState(this.activityName, this.activityType, this.perticipants);
  @override
  // TODO: implement props
  List<Object?> get props =>[activityName, activityType,perticipants];

}