
import 'package:reservamos/data/datasources/weather_remote_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:reservamos/data/exceptions/exceptions.dart';
import 'package:reservamos/domain/failures/failures.dart';
import '../../domain/entities/weatlogic_entity.dart';
import '../../domain/repositories/weat_repo.dart';
import '../models/weather_datasource_model.dart';


class WeatRepoImpl implements WeatRepo {
  final WeatRemoteDatasource weatherRemoteDatasource;
  WeatRepoImpl({required this.weatherRemoteDatasource});

  @override
  Future<Either<Failure, WeatLogicEntity>> getWeatherLogicFromDatasource(String place) async {
    try {
      final result = await weatherRemoteDatasource.getRandomWeatherFromApi(place);
     final listResult = List<Daily>.from(result);
      return right(WeatLogicEntity(listDaily: listResult));
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      //handle the exception
      return left(GeneralFailure());
    }
  }

}