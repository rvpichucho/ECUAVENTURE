
import 'package:ecuaventure/src/models/squares_vehicles.dart';

import 'package:ecuaventure/src/widgets/reservation_details_form_widget.dart';
import 'package:ecuaventure/src/widgets/square_card/square_details_content.dart';
import 'package:flutter/material.dart';
class SquareDetailsWidget extends StatefulWidget {
  const SquareDetailsWidget({Key? key, required this.reservation})
      : super(key: key);
  final Squares reservation;

  @override
  _SquareDetailsWidgetState createState() =>
      _SquareDetailsWidgetState();
}

class _SquareDetailsWidgetState extends State<SquareDetailsWidget>
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
        SquareDetailsContentWidget(reservation: widget.reservation),
        ReservationDetailsFormWidget(
            id: widget.reservation.idsquare ?? ""),
        ReservationDetailsFormWidget(
            id: widget.reservation.idsquare   ?? "")
      ]),
    );
  }
}
