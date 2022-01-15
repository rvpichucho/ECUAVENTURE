import 'package:ecuaventure/src/models/buggys_vehicles.dart';
import 'package:ecuaventure/src/widgets/buggy_card/buggy_details_content.dart';

import 'package:ecuaventure/src/widgets/reservation_details_form_widget.dart';
import 'package:flutter/material.dart';

class BuggyDetailsWidget extends StatefulWidget {
  const BuggyDetailsWidget({Key? key, required this.reservation})
      : super(key: key);
  final Buggys reservation;

  @override
  _BuggyDetailsWidgetState createState() => _BuggyDetailsWidgetState();
}

class _BuggyDetailsWidgetState extends State<BuggyDetailsWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> _myTabs = <Tab>[
    const Tab(text: 'Detalles'),
    const Tab(text: 'Inicio')
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
        BuggyDetailsContentWidget(reservation: widget.reservation),
        ReservationDetailsFormWidget(id: widget.reservation.idbuggy ?? "")
      ]),
    );
  }
}
