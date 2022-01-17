import 'dart:convert';

import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:http/http.dart' as http;

class ServiceBike {
  ServiceBike();
  final String _rootUrl = "https://ecuaventure-d9eb0.web.app/api/bike";
  Future<List<Bikes>> getBike() async {
    List<Bikes> result = [];
    try {
      var url = Uri.parse(_rootUrl);

      final response = await http.get(url);
      if (response.body.isEmpty) return result;
      List<dynamic> listBody = json.decode(response.body);

      for (var item in listBody) {
        final tabla = Bikes.fromJson(item);
        result.add(tabla);
      }
      return result;
    } catch (ex) {
      return result;
    }
  }
}
