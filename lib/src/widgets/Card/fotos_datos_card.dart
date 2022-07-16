import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/models/buggys_vehicles.dart';
import 'package:ecuaventure/src/models/foto_model.dart';
import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:ecuaventure/src/models/squares_vehicles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class ListDataFoto extends StatefulWidget {
  const ListDataFoto({Key? key}) : super(key: key);

  @override
  _ListDataFotoState createState() => _ListDataFotoState();
}

class _ListDataFotoState extends State<ListDataFoto> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _listDataFotos = FirebaseFirestore.instance
        .collection('photos')
        .where('iduser', isEqualTo: user!.uid)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _listDataFotos,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: SizedBox(child: Text('Error al consultar datos.')),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()),
          );
        }

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
          child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Foto model = Foto.fromJson(document.data() as Map<String, dynamic>);
            return DataFotoCard(
              model: model,
            );
          }).toList()),
        );
      },
    );
  }
}

class DataFotoCard extends StatefulWidget {
  const DataFotoCard({Key? key, required this.model}) : super(key: key);
  final Foto model;
  @override
  State<DataFotoCard> createState() => _DataFotoCardState();
}

class _DataFotoCardState extends State<DataFotoCard> {
  Bikes _data = Bikes();
  Buggys _data1 = Buggys();
  Motorcycles _data2 = Motorcycles();
  Squares _data3 = Squares();
  String _dataVehicles = '';

  @override
  void initState() {
    super.initState();
    //bikes
    FirebaseFirestore.instance
        .collection("bikes")
        .doc(widget.model.idvehicles)
        .get()
        .then((value) {
      _data = Bikes.fromJson(value.data() as Map<String, dynamic>);
      setState(() {});
    });
    //buggys
    FirebaseFirestore.instance
        .collection("buggys")
        .doc(widget.model.idvehicles)
        .get()
        .then((value) {
      _data1 = Buggys.fromJson(value.data() as Map<String, dynamic>);
      setState(() {});
    });
    //motos
    FirebaseFirestore.instance
        .collection("motorcycles")
        .doc(widget.model.idvehicles)
        .get()
        .then((value) {
      _data2 = Motorcycles.fromJson(value.data() as Map<String, dynamic>);
      setState(() {});
    });
    //cuadrones
    FirebaseFirestore.instance
        .collection("squares")
        .doc(widget.model.idvehicles)
        .get()
        .then((value) {
      _data3 = Squares.fromJson(value.data() as Map<String, dynamic>);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final url = widget.model.url!;
    //condiciones para mostrar datos de las colecciones de vehiculos
    if (widget.model.idvehicles == _data.idbike) {
      _dataVehicles = _data.name.toString() + ' - ' + _data.model.toString();
    } else if (widget.model.idvehicles == _data1.idbuggy) {
      _dataVehicles = _data1.name.toString() + ' - ' + _data1.model.toString();
    } else if (widget.model.idvehicles == _data2.idmotorcycle) {
      _dataVehicles = _data2.name.toString() + ' - ' + _data2.model.toString();
    } else if (widget.model.idvehicles == _data3.idsquare) {
      _dataVehicles = _data3.name.toString() + ' - ' + _data3.model.toString();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Stack(
          children: <Widget>[
            Card(
              color: color_const.skyColorC,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListTile(
                  title: Center(
                    child: Text('Datos',
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  subtitle: Column(
                    children: [
                      const SizedBox(height: 25.0),
                      Row(
                        children: [
                          Expanded(
                            child: Image(
                              image: NetworkImage(url),
                              height: 140,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      ListTile(
                        title: const Text('Observación'),
                        subtitle: Text(widget.model.observation.toString()),
                      ),
                      ListTile(
                        title: const Text('Fecha'),
                        subtitle: Text(widget.model.date.toString()),
                      ),
                      ListTile(
                        title: const Text('Vehículo'),
                        subtitle: Text(_dataVehicles.toString()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
