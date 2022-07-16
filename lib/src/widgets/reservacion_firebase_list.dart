import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/components/menu_lateral.dart';
import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/models/buggys_vehicles.dart';
import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:ecuaventure/src/models/squares_vehicles.dart';
import 'package:ecuaventure/src/pages/details_reservation_page.dart';
import 'package:ecuaventure/src/widgets/Card/bike_card.dart';
import 'package:ecuaventure/src/widgets/Card/buggy_card.dart';
import 'package:ecuaventure/src/widgets/Card/motorcycle_card.dart';
import 'package:ecuaventure/src/widgets/Card/square_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VehiclesReservationList extends StatefulWidget {
  const VehiclesReservationList({Key? key}) : super(key: key);

  @override
  _VehiclesReservationListState createState() =>
      _VehiclesReservationListState();
}

class _VehiclesReservationListState extends State<VehiclesReservationList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_const.blueC,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.reservationI,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        bottom: TabBar(
          tabs: [
            Tab(
              child: Text(AppLocalizations.of(context)!.bicycles),
              icon: const Icon(
                Icons.directions_bike_outlined,
              ),
            ),
            Tab(
              child: Text(AppLocalizations.of(context)!.motorcycles),
              icon: const Icon(
                Icons.two_wheeler_outlined,
              ),
            ),
            Tab(
              child: Text(AppLocalizations.of(context)!.quad),
              icon: const Icon(
                Icons.agriculture_outlined,
              ),
            ),
            const Tab(
              text: 'Buggys',
              icon: Icon(
                Icons.agriculture_outlined,
              ),
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: const MenuLateral(),
      body: TabBarView(controller: _tabController, children: const [
        ReservationBike(),
        ReservationMotorcycle(),
        ReservationSquare(),
        ReservationBuggys(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DetailsReservationPage()));
        },
        child: const Icon(
          Icons.inventory_outlined,
        ),
        backgroundColor: color_const.ligthBlueC,
      ),
    );
  }
}

class ReservationBike extends StatelessWidget {
  const ReservationBike({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final Stream<QuerySnapshot> _bikesListReservation = FirebaseFirestore
        .instance
        .collection('bikes')
        .where('priority', isEqualTo: 2)
        .where('iduser', isEqualTo: user!.uid)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _bikesListReservation,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: SizedBox(
                child: Text('Error al consultar datos de reservación.')),
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
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Bikes model =
                        Bikes.fromJson(document.data() as Map<String, dynamic>);
                    return BikeCard(model: model);
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ReservationMotorcycle extends StatelessWidget {
  const ReservationMotorcycle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final Stream<QuerySnapshot> _bikesListReservation = FirebaseFirestore
        .instance
        .collection('motorcycles')
        .where('priority', isEqualTo: 2)
        .where('iduser', isEqualTo: user!.uid)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _bikesListReservation,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: SizedBox(
                child: Text('Error al consultar datos de reservación.')),
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
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Motorcycles model = Motorcycles.fromJson(
                        document.data() as Map<String, dynamic>);
                    return MotorcyclesCard(model: model);
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ReservationSquare extends StatelessWidget {
  const ReservationSquare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final Stream<QuerySnapshot> _bikesListReservation = FirebaseFirestore
        .instance
        .collection('squares')
        .where('priority', isEqualTo: 2)
        .where('iduser', isEqualTo: user!.uid)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _bikesListReservation,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: SizedBox(
                child: Text('Error al consultar datos de reservación.')),
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
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Squares model = Squares.fromJson(
                        document.data() as Map<String, dynamic>);
                    return SquareCard(model: model);
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ReservationBuggys extends StatelessWidget {
  const ReservationBuggys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final Stream<QuerySnapshot> _bikesListReservation = FirebaseFirestore
        .instance
        .collection('buggys')
        .where('priority', isEqualTo: 2)
        .where('iduser', isEqualTo: user!.uid)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _bikesListReservation,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: SizedBox(
                child: Text('Error al consultar datos de reservación.')),
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
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Buggys model = Buggys.fromJson(
                        document.data() as Map<String, dynamic>);
                    return BuggyCard(model: model);
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
