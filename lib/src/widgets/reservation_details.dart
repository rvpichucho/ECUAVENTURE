import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/widgets/reservation_details_content_widget.dart';
import 'package:ecuaventure/src/widgets/reservation_details_form_widget.dart';
import 'package:flutter/material.dart';
class ReservationDetailsWidget extends StatefulWidget {
  const ReservationDetailsWidget({Key? key, required this.reservation})
      : super(key: key);
  final Bikes reservation;

  @override
  _ReservationDetailsWidgetState createState() =>
      _ReservationDetailsWidgetState();
}

class _ReservationDetailsWidgetState extends State<ReservationDetailsWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> _myTabs = <Tab>[
    const Tab(text: 'Detalles dsd'),
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
        ReservationDetailsContentWidget(reservation: widget.reservation),
        ReservationDetailsFormWidget(
            id: widget.reservation.idbike ?? ""),
        ReservationDetailsFormWidget(
            id: widget.reservation.idbike ?? "")
      ]),
    );
  }
}
