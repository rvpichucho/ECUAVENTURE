/*import 'dart:convert';
import 'package:ecuaventure/src/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class UsuarioService {
  final String _firebaseAPIKey = 'AIzaSyBwdjG7lSK2CJ8wfLDpk-r8cJMRktZ2Xn8';
  final String _rootUrl = "https://trifasic-backend-9bc1e.web.app/api/registro";

  Future<Map<String, dynamic>> login(Usuario usuario) async {
    final authData = {
      'email': usuario.email,
      'password': usuario.password,
      'returnSecureToken': true
    };

    final queryParams = {"key": _firebaseAPIKey};

    var uri = Uri.https("www.googleapis.com",
        "/identitytoolkit/v3/relyingparty/verifyPassword", queryParams);

    final resp = await http.post(uri, body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    developer.log(decodedResp.toString());
    return decodedResp;
  }

  Future<int> postUsuario(Usuario usuario) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      String _usuarioBody = usuarioToJson(usuario);
      var url = Uri.parse(_rootUrl);
      final response =
          await http.post(url, headers: _headers, body: _usuarioBody);
      if (response.body.isEmpty) return 400;
      Map<String, dynamic> content = json.decode(response.body);
      return content["estado"];
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
      return 500;
    }
  }
}*/
