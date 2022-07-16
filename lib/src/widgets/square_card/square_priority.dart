import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/squares_vehicles.dart';
import 'package:ecuaventure/src/theme/main_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SquarePriorityWidget extends StatefulWidget {
  SquarePriorityWidget({Key? key, required this.priority, required this.uid})
      : super(key: key);
  final int? priority;
  String? uid;

  @override
  State<SquarePriorityWidget> createState() => _SquarePriorityWidgetState();
}

class _SquarePriorityWidgetState extends State<SquarePriorityWidget> {
  Squares _data = Squares();
  String _dataEstado = '';

  @override
  void initState() {
    super.initState();
    //bikes
    FirebaseFirestore.instance
        .collection("squares")
        .doc(widget.uid)
        .get()
        .then((value) {
      _data = Squares.fromJson(value.data() as Map<String, dynamic>);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_data.priority == 3) {
      _dataEstado = 'Disponible';
    } else if (_data.priority == 2) {
      _dataEstado = 'En Espera';
    } else if (_data.priority == 1) {
      _dataEstado = 'Reservado';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 0.0),
      child: Column(
        children: [
          Text(_dataEstado.toString()),
          const SizedBox(height: 25.0),
          CircleAvatar(
              radius: 20.0,
              backgroundColor: widget.priority == 1
                  ? AppTheme.colorHighPriority
                  : widget.priority == 2
                      ? AppTheme.colorMediumPriority
                      : AppTheme.colorLowPriority,
              child: Icon(Icons.event_available_outlined,
                  color: widget.priority == 2 ? Colors.black : Colors.white)),
        ],
      ),
    );
  }
}
