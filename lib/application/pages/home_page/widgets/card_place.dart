import 'package:flutter/material.dart';

import '../../../../data/models/weather_datasource_model.dart';

class CardPlace extends StatelessWidget {
  final String placeLocation;
  final List<Daily> daily;
  const CardPlace(
      {super.key, required this.placeLocation, required this.daily});

  @override
  Widget build(BuildContext context) {

    /*  final temp = temperature-273.15; */
    double max1 = daily[0].temp.max - 273.15;
    double min1 = daily[0].temp.min - 273.15;
    double temp1 = daily[0].temp.day - 273.15;
    return Column(
      children: [
        Card(
          color: Colors.green,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(placeLocation, style: const TextStyle(color: Colors.white,fontSize: 20)),
                  Text("${temp1.round()}°", style: const TextStyle(fontSize: 40,color: Colors.white)),
                  Text("Mín: ${min1.round()}° Máx: ${max1.round()}°",style: const TextStyle(color: Colors.white,fontSize: 15)),
                ],
              )),
        ),
        const SizedBox(height: 50,),
        SizedBox(
          height: 500,
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: daily.length,
            itemBuilder: (context, index) {
              double max = daily[index].temp.max - 273.15;
              double min = daily[index].temp.min - 273.15;
              var date =
                  DateTime.fromMillisecondsSinceEpoch(daily[index].dt * 1000);
              return Column(
                children: [
                  ListTile(
                    tileColor: Colors.white,
                    isThreeLine: true,
                    leading: Text("${date.day}/${date.month}"),
                    subtitle: Text(daily[index].weather[0].description),
                    title: Row(
                      children: [
                        const Text("min "),
                        Text("${min.round()}°"),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text("max "),
                        Text("${max.round()}°"),
                      ],
                    ),
                    trailing: daily[index].weather[0].icon == "01d"
                        ? const Icon(
                            Icons.sunny,
                            color: Colors.yellowAccent,
                            size: 28,
                          )
                        : const Icon(
                            Icons.cloud,
                            color: Colors.blueAccent,
                            size: 28,
                          ),
                  ),
                  const Divider(color: Colors.grey, endIndent: 16, indent: 16),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
