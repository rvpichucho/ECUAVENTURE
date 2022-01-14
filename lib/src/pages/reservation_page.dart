import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/widgets/reservation_details.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key, required this.reservation})
      : super(key: key);
  final Bikes reservation;

  @override
  Widget build(BuildContext context) {
    final url = reservation.image!;
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(reservation.name ?? "",
                  overflow: TextOverflow.ellipsis),
              // ignore: unrelated_type_equality_checks
              background:Stack(fit: StackFit.expand,children:<Widget>[Image.network(url)]),
              
             
            ),
          ),
          SliverFillRemaining(
              child: ReservationDetailsWidget(reservation: reservation))
        ],
      )),
    );
  }
}
