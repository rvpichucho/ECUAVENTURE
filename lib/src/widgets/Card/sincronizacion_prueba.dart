import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Sincro extends StatefulWidget {
  const Sincro({Key? key, required this.currentMotocycle}) : super(key: key);
  final CollectionReference currentMotocycle;

  @override
  _SincroState createState() => _SincroState();
}

class _SincroState extends State<Sincro> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.currentMotocycle.orderBy('name').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Loading'));
          }

          return Column(
            children: <Widget>[
              Flexible(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    children: snapshot.data!.docs.map((bikes) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(bikes['name'],
                              style: Theme.of(context).textTheme.headline5),
                          subtitle: Column(
                            children: [
                              ListTile(
                                title: const Text('Modelo'),
                                subtitle: Text(bikes['model']),
                                leading: Icon(Icons.home_outlined,
                                    color: Theme.of(context).primaryColorDark),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
