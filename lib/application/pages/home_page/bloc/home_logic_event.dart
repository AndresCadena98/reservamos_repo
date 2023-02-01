part of 'home_logic_bloc.dart';

@immutable
abstract class HomeLogicEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeRequestedEvent extends HomeLogicEvent {
}

class TempRequestedEvent extends HomeLogicEvent {
}

class HomeRequestedTextedEvent extends HomeLogicEvent {
final String place;

  HomeRequestedTextedEvent(this.place);
}