import 'package:get_it/get_it.dart';
import 'package:reservamos/application/pages/home_page/bloc/home_logic_bloc.dart';
import 'package:reservamos/data/datasources/home_remote_datasource.dart';
import 'package:reservamos/data/datasources/weather_remote_datasource.dart';
import 'package:reservamos/data/repositories/home_repo_impl.dart';
import 'package:reservamos/data/repositories/weather_repo_impl.dart';
import 'package:reservamos/domain/repositories/home_repo.dart';
import 'package:reservamos/domain/repositories/weat_repo.dart';
import 'package:reservamos/domain/usecases/advice_usecases.dart';
import 'package:http/http.dart' as http;
import 'package:reservamos/domain/usecases/weather_usecases.dart';



final serverLocator = GetIt.I;

Future<void> init() async {
// !  layer
  serverLocator.registerFactory(() => HomeLogicUsesOptions(homeRepo: serverLocator()));
  serverLocator.registerFactory(() => WeatherLogicUsesCases(weatherRepo: serverLocator()));

  serverLocator.registerFactory<HomeLogicBloc>(() => HomeLogicBloc(
        homeUseCase: serverLocator(),
        weatherLogicUsesCases: serverLocator(),
      ));
// ! data layer

  serverLocator.registerFactory<HomeRepo>(() => HomeRepoImpl(homeRemoteDatasource: serverLocator()));
  serverLocator.registerFactory<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl(client: serverLocator()));
  serverLocator.registerFactory<WeatRepo>(
      () => WeatRepoImpl(weatherRemoteDatasource: serverLocator()));
    serverLocator.registerFactory<WeatRemoteDatasource>(
        () => WeatRemoteDatasourceImpl(client: serverLocator()));

// ! externs
  serverLocator.registerFactory(() => http.Client());
}
