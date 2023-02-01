import 'package:reservamos/data/datasources/home_remote_datasource.dart';
import 'package:reservamos/data/exceptions/exceptions.dart';
import 'package:reservamos/domain/entities/homelogic_entity.dart';
import 'package:reservamos/domain/failures/failures.dart';
import 'package:reservamos/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource homeRemoteDatasource;
  HomeRepoImpl({required this.homeRemoteDatasource});

  @override
  Future<Either<Failure, HomeLogicEntity>> getHomeLogicFromDatasource(String place) async {
    try {
      final result = await homeRemoteDatasource.getRandomHomeFromApi(place);
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      //handle the exception
      return left(GeneralFailure());
    }
  }
}
