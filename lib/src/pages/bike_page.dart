import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/widgets/bike_card/bike_details_card.dart';
//import 'package:ecuaventure/src/widgets/bikle_widget.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/*class BikePage extends StatefulWidget {
  const BikePage({Key? key}) : super(key: key);

  @override
  _BikePageState createState() => _BikePageState();
}

class _BikePageState extends State<BikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.bicycles,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      body: const BikeWidget(),
    );
  }
}*/

class BikePage extends StatelessWidget {
  const BikePage({Key? key, required this.reservation}) : super(key: key);
  final Bikes reservation;

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
              child: BikeDetailsWidget(reservation: reservation))
        ],
      )),
    );
  }
}
