import 'dart:convert';
import 'package:ecuaventure/src/models/squares_vehicles.dart';
import 'package:http/http.dart' as http;

class ServiceSquare {
  ServiceSquare();
  final String _rootUrl = "https://ecuaventure-d9eb0.web.app/api/square";
  Future<List<Squares>> getSquare() async {
    List<Squares> result = [];
    try {
      var url = Uri.parse(_rootUrl);

      final response = await http.get(url);
      if (response.body.isEmpty) return result;
      List<dynamic> listBody = json.decode(response.body);

      for (var item in listBody) {
        final tabla = Squares.fromJson(item);
        result.add(tabla);
      }
      return result;
    } catch (ex) {
      return result;
    }
  }
}
