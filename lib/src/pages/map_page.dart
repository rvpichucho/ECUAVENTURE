import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _kEcuador = const CameraPosition(
    target: LatLng(-1.39699, -78.42289),
    zoom: 16.0,
  );
  final Stream<QuerySnapshot> _bikesListReservation = FirebaseFirestore.instance
      .collection('motorcycles')
      .where('priority', isEqualTo: 2)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _bikesListReservation,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: SizedBox(
                      child: Text('Error al consultar datos de reservación.')),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasData) {
                Set<Marker> _rsv = snapshot.data!.docs
                    .map<Marker>((DocumentSnapshot document) {
                  //Bikes model =Bikes.fromJson(document.data() as Map<String, dynamic>);
                  Motorcycles model = Motorcycles.fromJson(
                      document.data() as Map<String, dynamic>);

                  LatLng _kMnt =
                      LatLng(model.lat ?? -1.39699, model.lng ?? -78.42289);
                  return Marker(
                      icon: model.priority == 1
                          ? BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueRed)
                          : model.priority == 2
                              ? BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueGreen)
                              : BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueOrange),
                      infoWindow: InfoWindow(title: model.name),
                      markerId: MarkerId(document.id),
                      position: _kMnt);
                }).toSet();
                //////
                return GoogleMap(
                  markers: _rsv,
                  //mapType: MapType.hybrid,
                  mapType: MapType.normal,
                  initialCameraPosition: _kEcuador,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                );
              }
              /////
              return const CircularProgressIndicator();
            }));
  }
}
