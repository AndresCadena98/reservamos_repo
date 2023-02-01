import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reservamos/data/exceptions/exceptions.dart';
import '../models/home_datasource_model.dart';

abstract class HomeRemoteDatasource {
  Future<HomeDataSourceModel> getRandomHomeFromApi(String place);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final http.Client client;
  HomeRemoteDatasourceImpl({required this.client});
  @override
  Future<HomeDataSourceModel> getRandomHomeFromApi(String place) async {
  
    final response = await client.get(
      Uri.parse("https://search.reservamos.mx/api/v2/places?q=$place"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 201) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return HomeDataSourceModel.fromJson(responseBody[0]);
    }
  }
}
