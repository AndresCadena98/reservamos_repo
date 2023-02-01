import 'package:dartz/dartz.dart';
import 'package:reservamos/domain/entities/homelogic_entity.dart';
import 'package:reservamos/domain/failures/failures.dart';
import 'package:reservamos/domain/repositories/home_repo.dart';

class HomeLogicUsesOptions {
  HomeLogicUsesOptions({required this.homeRepo});
  final HomeRepo homeRepo;

  Future <Either<Failure,HomeLogicEntity>> getHomeLogic(String place) async {

    return homeRepo.getHomeLogicFromDatasource(place);
    //business logic
  }
}