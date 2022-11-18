import 'package:delivery_app/models/plasce_autocomplate_model.dart';
import 'package:delivery_app/repositories/places/base_place_repository.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

class PlaceRepository extends BasePalaceRepository {
  final String key = 'AIzaSyCUc5V5VxUC2HhpktpoaMP9sI9A275reXY';
  final String types = 'geocode';

  @override
  Future<List<PlaceAutocomplate>> getAutocomplate(String searchInput) async {
    final String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=geocode&key=AIzaSyCUc5V5VxUC2HhpktpoaMP9sI9A275reXY";

    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceAutocomplate.fromJson(place)).toList();
  }
}
