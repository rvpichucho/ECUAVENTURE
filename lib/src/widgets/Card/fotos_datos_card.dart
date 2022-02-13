import 'package:ecuaventure/src/models/foto_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class ListDataFoto extends StatefulWidget {
  const ListDataFoto({Key? key}) : super(key: key);

  @override
  _ListDataFotoState createState() => _ListDataFotoState();
}

class _ListDataFotoState extends State<ListDataFoto> {
  final Stream<QuerySnapshot> _listDataFotos =
      FirebaseFirestore.instance.collection('fotos').snapshots();
  @override
  Widget build(BuildContext context) {
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
            return DataFotoCard(model: model);
          }).toList()),
        );
      },
    );
  }
}

class DataFotoCard extends StatelessWidget {
  const DataFotoCard({Key? key, required this.model}) : super(key: key);
  final Foto model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Stack(
          children: <Widget>[
            Card(
              color: color_const.skyColorC,
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: ListTile(
                  title: Center(
                    child: Text('Datos',
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  subtitle: Column(
                    children: [
                      ListTile(
                        title: const Text('Observación'),
                        subtitle: Text(model.observacion.toString()),
                      ),
                      ListTile(
                        title: const Text('Vehículo'),
                        subtitle: Text(model.idvehicles.toString()),
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
