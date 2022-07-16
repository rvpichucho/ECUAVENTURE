import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/models/buggys_vehicles.dart';
import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:ecuaventure/src/models/squares_vehicles.dart';
import 'package:ecuaventure/src/pages/reservation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:collection/collection.dart';

class ReservacionWidget extends StatefulWidget {
  const ReservacionWidget({Key? key}) : super(key: key);

  @override
  _ReservacionWidgetState createState() => _ReservacionWidgetState();
}

class _ReservacionWidgetState extends State<ReservacionWidget> {
  CollectionReference detailsReservation =
      FirebaseFirestore.instance.collection('reservations');

  final hour = TextEditingController();
  DateTime date = DateTime.now();
  User? user = FirebaseAuth.instance.currentUser;
  Bikes _data = Bikes();
  Buggys _data1 = Buggys();
  Motorcycles _data2 = Motorcycles();
  Squares _data3 = Squares();
  //lista bikes
  List<dynamic> vehicles = [];
  List<int> vehiclesBikesPrecio = [];
  //lista buggys
  List<dynamic> vehicles1 = [];
  List<int> vehiclesBuggysPrecio = [];
  //lista motos
  List<dynamic> vehicles2 = [];
  List<int> vehiclesMotorcyclesPrecio = [];
  //listasquares
  List<dynamic> vehicles3 = [];
  List<int> vehiclesSquaresPrecio = [];
  //variables para sumar el total de pago
  late int sumBikes;
  late int sumBuggys;
  late int sumMotorcycles;
  late int sumSquares;
  //variables para actualizar prioridad
  Bikes bike = Bikes();
  Buggys buggy = Buggys();
  Motorcycles motorcycle = Motorcycles();
  Squares square = Squares();

  @override
  void initState() {
    super.initState();
    sumBikes = 0;
    sumBuggys = 0;
    sumMotorcycles = 0;
    sumSquares = 0;

    //consultas de vehiculos para mostrar los nombres y realizar la suma total
    //bikes
    CollectionReference collectionBike =
        FirebaseFirestore.instance.collection('bikes');
    collectionBike
        .where('iduser', isEqualTo: user!.uid)
        .where('priority', isEqualTo: 2)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        // doc.data() is never undefined for query doc snapshots
        _data = Bikes.fromJson(doc.data() as Map<String, dynamic>);
        //dataVehiclesBikes = _data.name.toString() + ' - ' + _data.model;
        vehicles.add(_data.name.toString() + ' - ' + _data.model.toString());
        vehiclesBikesPrecio.add(int.parse(_data.price.toString()));
        List<int> nums = vehiclesBikesPrecio;
        sumBikes = nums.sum;
        setState(() {});
      }
    });
    //buggys
    CollectionReference collectionBuggy =
        FirebaseFirestore.instance.collection('buggys');
    collectionBuggy
        .where('iduser', isEqualTo: user!.uid)
        .where('priority', isEqualTo: 2)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        // doc.data() is never undefined for query doc snapshots
        _data1 = Buggys.fromJson(doc.data() as Map<String, dynamic>);
        vehicles1.add(_data1.name.toString() + ' - ' + _data1.model.toString());
        vehiclesBuggysPrecio.add(int.parse(_data1.price.toString()));
        List<int> nums1 = vehiclesBuggysPrecio;
        sumBuggys = nums1.sum;
        setState(() {});
      }
    });
    //motos
    CollectionReference collectionMotorcycle =
        FirebaseFirestore.instance.collection('motorcycles');
    collectionMotorcycle
        .where('iduser', isEqualTo: user!.uid)
        .where('priority', isEqualTo: 2)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        // doc.data() is never undefined for query doc snapshots
        _data2 = Motorcycles.fromJson(doc.data() as Map<String, dynamic>);
        vehicles2.add(_data2.name.toString() + ' - ' + _data2.model.toString());
        vehiclesMotorcyclesPrecio.add(int.parse(_data2.price.toString()));
        List<int> nums2 = vehiclesMotorcyclesPrecio;
        sumMotorcycles = nums2.sum;
        setState(() {});
      }
    });
    //cuadrones
    CollectionReference collectionSquare =
        FirebaseFirestore.instance.collection('squares');
    collectionSquare
        .where('iduser', isEqualTo: user!.uid)
        .where('priority', isEqualTo: 2)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        // doc.data() is never undefined for query doc snapshots
        _data3 = Squares.fromJson(doc.data() as Map<String, dynamic>);
        vehicles3.add(_data3.name.toString() + ' - ' + _data3.model.toString());
        vehiclesSquaresPrecio.add(int.parse(_data3.price.toString()));
        List<int> nums3 = vehiclesSquaresPrecio;
        sumSquares = nums3.sum;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    hour.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              margin: const EdgeInsets.only(left: 12, right: 12),
              elevation: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.schedule_outlined,
                            color: Theme.of(context).primaryColorDark),
                        labelText: AppLocalizations.of(context)!.rentalHours,
                      ),
                      controller: hour,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25.0),
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              margin: const EdgeInsets.only(left: 12, right: 12),
              elevation: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Text("Ingresar la fecha",
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  DatePickerWidget(
                      lastDate: DateTime.now().add(const Duration(days: 90)),
                      looping: false, // default is not looping
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DatePicker.localeFromString('es'),
                      onChange: (DateTime newDate, _) {
                        date = newDate;
                      }),
                ],
              ),
            ),
            const SizedBox(height: 25.0),
            Container(
              alignment: AlignmentDirectional.center,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin: const EdgeInsets.only(left: 15, right: 15),
                elevation: 4,
                child: MaterialButton(
                  color: color_const.blueC,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16.0),
                    child: Text(
                      AppLocalizations.of(context)!.confirm,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  onPressed: () {
                    postDetailsReservation(context, hour.text, date);
                    hour.clear();
                    //date.clear();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  postDetailsReservation(BuildContext context, String hora, DateTime fecha) {
    //total de la sumatoria del precio de vehiculos
    var total =
        (sumBikes + sumBuggys + sumMotorcycles + sumSquares) * int.parse(hora);
    String totalTexto = total.toString();
    Widget okButton = TextButton(
      child: const Text("Guardar"),
      onPressed: () {
        //consultas para actualizar estado de los vehiculos a reservado
        //bikes
        CollectionReference updateBike =
            FirebaseFirestore.instance.collection('bikes');
        updateBike
            .where('iduser', isEqualTo: user!.uid)
            .where('priority', isEqualTo: 2)
            .get()
            .then((querySnapshot) {
          for (var doc in querySnapshot.docs) {
            // doc.data() is never undefined for query doc snapshots
            bike = Bikes.fromJson(doc.data() as Map<String, dynamic>);
            updateBike.doc(bike.idbike).update({'priority': 1});
            setState(() {});
          }
        });
        //buggys
        CollectionReference updateBuggys =
            FirebaseFirestore.instance.collection('buggys');
        updateBuggys
            .where('iduser', isEqualTo: user!.uid)
            .where('priority', isEqualTo: 2)
            .get()
            .then((querySnapshot) {
          for (var doc in querySnapshot.docs) {
            // doc.data() is never undefined for query doc snapshots
            buggy = Buggys.fromJson(doc.data() as Map<String, dynamic>);
            updateBuggys.doc(buggy.idbuggy).update({'priority': 1});
            setState(() {});
          }
        });
        //motos
        CollectionReference updateMotorcycles =
            FirebaseFirestore.instance.collection('motorcycles');
        updateMotorcycles
            .where('iduser', isEqualTo: user!.uid)
            .where('priority', isEqualTo: 2)
            .get()
            .then((querySnapshot) {
          for (var doc in querySnapshot.docs) {
            // doc.data() is never undefined for query doc snapshots
            motorcycle =
                Motorcycles.fromJson(doc.data() as Map<String, dynamic>);
            updateMotorcycles
                .doc(motorcycle.idmotorcycle)
                .update({'priority': 1});
            setState(() {});
          }
        });
        //squares
        CollectionReference updateSquares =
            FirebaseFirestore.instance.collection('squares');
        updateSquares
            .where('iduser', isEqualTo: user!.uid)
            .where('priority', isEqualTo: 2)
            .get()
            .then((querySnapshot) {
          for (var doc in querySnapshot.docs) {
            // doc.data() is never undefined for query doc snapshots
            square = Squares.fromJson(doc.data() as Map<String, dynamic>);
            updateSquares.doc(square.idsquare).update({'priority': 1});
            setState(() {});
          }
        });
        //añadir datos de reservacion a firebase
        detailsReservation.add({
          'idreservation': '',
          'iduser': user!.uid,
          'hour': hora,
          'totalValue': totalTexto,
          'date': fecha.toString(),
          'vehicles': (vehicles + vehicles1 + vehicles2 + vehicles3).toList(),
          'state': 1,
        }).then((value) {
          detailsReservation.doc(value.id).update({'idreservation': value.id});
        });
        Navigator.of(context).pop();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ReservationPage()));
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Total a pagar"),
      content: Text(totalTexto + ' dólares'),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
