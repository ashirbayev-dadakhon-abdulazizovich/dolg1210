import 'package:flutter/material.dart';
import '../models/station_dto.dart';
import '../data/api_service.dart';

void main() {
  List<int> stationIds = [1,2,3,4];
  StationApiService apiService = StationApiService();

  apiService.getStationsById(stationIds).then((stations) {
    runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Станции метро:')),
        body: StationListWidget(stations),
      ),
    ));
  });
}

class StationListWidget extends StatelessWidget {
  final List<StationDto> stations;

  StationListWidget(this.stations);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stations.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${stations[index].id}: ${stations[index].name}, ${stations[index].color}'),
        );
      },
    );
  }
}