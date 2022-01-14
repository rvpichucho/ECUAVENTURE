
import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:ecuaventure/src/widgets/motorcycle_card/motorcycle_details_content.dart';

import 'package:ecuaventure/src/widgets/reservation_details_form_widget.dart';
import 'package:flutter/material.dart';
class MotorcycleDetailsWidget extends StatefulWidget {
  const MotorcycleDetailsWidget({Key? key, required this.reservation})
      : super(key: key);
  final Motorcycles reservation;

  @override
  _MotorcycleDetailsWidgetState createState() =>
      _MotorcycleDetailsWidgetState();
}

class _MotorcycleDetailsWidgetState extends State<MotorcycleDetailsWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> _myTabs = <Tab>[
    const Tab(text: 'Detalles'),
    const Tab(text: 'Inicio'),
    const Tab(text: 'Fin'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(tabs: _myTabs, controller: _tabController),
      body: TabBarView(controller: _tabController, children: [
        MotorcycleDetailsContentWidget(reservation: widget.reservation),
        ReservationDetailsFormWidget(
            id: widget.reservation.idmotorcycle ?? ""),
        ReservationDetailsFormWidget(
            id: widget.reservation.idmotorcycle  ?? "")
      ]),
    );
  }
}
