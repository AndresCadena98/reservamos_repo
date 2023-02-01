import 'package:equatable/equatable.dart';

import '../../data/models/weather_datasource_model.dart';

class WeatLogicEntity extends Equatable {
  const WeatLogicEntity({
    required this.listDaily,
  });

  final List<Daily> listDaily;

  @override
  List<Object?> get props => [listDaily];
}
