part of 'home_logic_bloc.dart';

@immutable
abstract class HomeLogicState extends Equatable {
    @override
  List<Object?> get props => [];
}

class HomeLogicInitial extends HomeLogicState {}


class HomeLStateLoading extends HomeLogicState {}

class HomeLStateLoaded extends HomeLogicState {
  final GeneralInformationWeather generalInf;

  HomeLStateLoaded({required this.generalInf});

  @override
  List<Object?> get props => [generalInf];
}

class HomeLStateError extends HomeLogicState {
  final String message;
  HomeLStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
