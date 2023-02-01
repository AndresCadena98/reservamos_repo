import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reservamos/data/exceptions/exceptions.dart';
import 'package:reservamos/data/models/weather_datasource_model.dart';



abstract class WeatRemoteDatasource {
  Future<List<Daily>>getRandomWeatherFromApi(String place);
}

class WeatRemoteDatasourceImpl implements WeatRemoteDatasource {
  final http.Client client;
  WeatRemoteDatasourceImpl({required this.client});
  @override
  Future <List<Daily>> getRandomWeatherFromApi(String place) async {
  
    final response = await client.get(
      Uri.parse("https://api.openweathermap.org/data/2.5/onecall?lat=19.5345279&lon=-99.1907364&exclude=current&appid=a5a47c18197737e8eeca634cd6acb581"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return WeatDatasourceModel.fromJson(responseBody).listDaily;
    }
  }
}
