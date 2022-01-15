import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:ecuaventure/src/widgets/motorcycle_card/motorcycle_details_card.dart';
import 'package:flutter/material.dart';

/*class MotorcyclePage extends StatefulWidget {
  const MotorcyclePage({Key? key}) : super(key: key);

  @override
  _MotorcyclePageState createState() => _MotorcyclePageState();
}

class _MotorcyclePageState extends State<MotorcyclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.motorcycles,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      body: const MotorcycleWidget(),
    );
  }
}*/
class MotorcyclePage extends StatelessWidget {
  const MotorcyclePage({Key? key, required this.reservation}) : super(key: key);
  final Motorcycles reservation;

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
              child: MotorcycleDetailsWidget(reservation: reservation))
        ],
      )),
    );
  }
}
