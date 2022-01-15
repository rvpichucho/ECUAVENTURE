import 'package:ecuaventure/src/models/buggys_vehicles.dart';
import 'package:ecuaventure/src/widgets/buggy_card/buggy_details_card.dart';

import 'package:flutter/material.dart';

/*class BuggyPage extends StatefulWidget {
  const BuggyPage({Key? key}) : super(key: key);

  @override
  _BuggyPageState createState() => _BuggyPageState();
}

class _BuggyPageState extends State<BuggyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: const Text(
            "Buggys",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      body: const BuggyWidget(),
    );
  }
}*/

class BuggyPage extends StatelessWidget {
  const BuggyPage({Key? key, required this.reservation}) : super(key: key);
  final Buggys reservation;

  @override
  Widget build(BuildContext context) {
    final url = reservation.image!;
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromRGBO(229, 234, 233, 1),
            floating: true,
            pinned: true,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(reservation.name ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              // ignore: unrelated_type_equality_checks
              background: Stack(
                  fit: StackFit.expand, children: <Widget>[Image.network(url)]),
            ),
          ),
          SliverFillRemaining(
              child: BuggyDetailsWidget(reservation: reservation))
        ],
      )),
    );
  }
}
