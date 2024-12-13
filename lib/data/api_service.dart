import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/station_dto.dart';
import '../service_key.dart';

class StationApiService {
  final String _apiUrl = 'https://api.vk.com/method/database.getMetroStationsById';
  final String _accessToken = service_key;
  final String _v = '5.199';

  Future<List<StationDto>> getStationsById(List<int> stationIds) async {
    var response = await http.get(Uri.parse('$_apiUrl?access_token=$_accessToken&v=$_v&station_ids=${stationIds.join(',')}'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['response'];
      return data.map((json) => StationDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}