import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'dart:convert';

class ServiceCar {
  ServiceCar();

  

  Future<List<Motorcycles>> getUsers() async {
    List<Motorcycles> result = [];

    try {
      CollectionReference collection =
          FirebaseFirestore.instance.collection("motorcycles");
      QuerySnapshot users = await collection.get();
      
      Map<String, dynamic> content = docs.data();
      
      if (users.docs.length != 0) {
        for (var doc in users.docs) {
          print(doc.data());
          //result.add(doc.data());
        }
      }
      return result;
    } catch (ex) {
      return result;
    }
  }
}
