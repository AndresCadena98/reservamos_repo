import 'package:dartz/dartz.dart';
import 'package:reservamos/domain/entities/homelogic_entity.dart';
import 'package:reservamos/domain/failures/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeLogicEntity>> getHomeLogicFromDatasource(String place);
}
