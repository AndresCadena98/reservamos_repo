import 'package:dartz/dartz.dart';
import 'package:reservamos/domain/failures/failures.dart';
import '../entities/weatlogic_entity.dart';

abstract class WeatRepo {
  Future<Either<Failure, WeatLogicEntity>> getWeatherLogicFromDatasource(String place);
}