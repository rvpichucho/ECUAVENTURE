import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:ecuaventure/src/models/foto_model.dart';

class FotosService {
  FotosService();

  CollectionReference collection =
      FirebaseFirestore.instance.collection('photos');

  //final String _rootUrl = "https://trifasic-backend-9bc1e.web.app/api/foto";

  Future<int> postDetailsPhoto(Foto foto) async {
    try {
      //final Map<String, String> _headers = {"content-type": "application/json"};
      //String _fotoBody = fotoToJson(foto);
      Map<String, dynamic> _fotoBody = foto.toJson();
      //var url = Uri.parse(_rootUrl);
      collection.add(_fotoBody);
      //final response = await http.post(url, headers: _headers, body: _fotoBody);
      return 400;
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
      return 500;
    }
  }

  Future<String> uploadImage(File image) async {
    final cloudinary = CloudinaryPublic('ddfmqjxz5', 'ovq0olas', cache: false);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );
      return response.secureUrl;
    } on CloudinaryException catch (e) {
      // ignore: avoid_print
      print(e.message);
      // ignore: avoid_print
      print(e.request);
      return "";
    }
  }
}
