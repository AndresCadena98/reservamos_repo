import 'package:dartz/dartz.dart';

import '../entities/weatlogic_entity.dart';
import '../failures/failures.dart';
import '../repositories/weat_repo.dart';

class WeatherLogicUsesCases {
  WeatherLogicUsesCases({required this.weatherRepo});
  final WeatRepo weatherRepo;

  Future <Either <Failure, WeatLogicEntity>> getWeatherLogic(String place) async {

    return weatherRepo.getWeatherLogicFromDatasource(place);
    //business logic
  }
}