import 'package:equatable/equatable.dart';
import 'package:reservamos/domain/entities/homelogic_entity.dart';

 class HomeDataSourceModel extends HomeLogicEntity with EquatableMixin{
  HomeDataSourceModel(
      {required int id,
      required String cityName,
      required String state,
      required String country,
      required String lat,
      required String long})
      : super(
            id: id,
            cityName: cityName,
            country: country,
            lat: lat,
            long: long,
            state: state);

    factory HomeDataSourceModel.fromJson(Map<String, dynamic> json) => HomeDataSourceModel(
        id: json["id"],
        cityName: json["city_name"],
        state: json["state"],
        country: json["country"],
        lat: json["lat"],
        long: json["long"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "city_name": cityName,
        "state": state,
        "country": country,
        "lat": lat,
        "long": long,

    };
}
