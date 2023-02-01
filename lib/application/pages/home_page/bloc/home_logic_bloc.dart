import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos/data/models/general_weather_model.dart';
import 'package:reservamos/domain/failures/failures.dart';
import 'package:reservamos/domain/usecases/advice_usecases.dart';
import 'package:reservamos/domain/usecases/weather_usecases.dart';


part 'home_logic_event.dart';
part 'home_logic_state.dart';

const serverFailureMessage = "Error en la API, Intenta con otra ciudad";
const cacheFailureMessage = "Ocurrio un error, intenta de nuevo";
const generalFailureMessage = "Algo no está funcionando, intenta de nuevo";

class HomeLogicBloc extends Bloc<HomeLogicEvent, HomeLogicState> {
  final HomeLogicUsesOptions homeUseCase;
  final WeatherLogicUsesCases weatherLogicUsesCases;

  HomeLogicBloc({
    required this.homeUseCase,
    required this.weatherLogicUsesCases,
  }) : super(HomeLogicInitial()) {
    String place = "";
    GeneralInformationWeather inf = GeneralInformationWeather("", "", []);
    on<HomeRequestedTextedEvent>((event, emit) async {
      place = event.place;
    });
    on<HomeRequestedEvent>((event, emit) async {
      emit(HomeLStateLoading());
      final failureOrHomeLog = await homeUseCase.getHomeLogic(place);

      failureOrHomeLog.fold(
          (failure) =>
              emit(HomeLStateError(message: _mapFailureToMessage(failure))),
          (homeL) {
        inf.city = homeL.cityName;
      });
    });

    on<TempRequestedEvent>((event, emit) async {
      final failureOrHomeLog =
          await weatherLogicUsesCases.getWeatherLogic(place);

      failureOrHomeLog.fold(
          (failure) =>
              emit(HomeLStateError(message: _mapFailureToMessage(failure))),
          (homeL) {
        inf.daily = homeL.listDaily;
        emit(HomeLStateLoaded(generalInf: inf));
      });
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
