

import 'package:equatable/equatable.dart';

class HomeLogicEntity extends Equatable {

   const HomeLogicEntity({
        required this.id,
        required this.cityName,
        required this.state,
        required this.country,
        required this.lat,
        required this.long,
    });

    final int id;
    final String cityName;
    final String state;
    final String country;
    final String lat;
    final String long;




  @override
  List<Object?> get props => [id,cityName,state,country,lat,long];

 

}