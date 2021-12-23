import 'package:flutter/material.dart';

class ReservacionWidget extends StatelessWidget {
  const ReservacionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.book_online_outlined, size: 50.0),
          Text("Reservación", style: Theme.of(context).textTheme.headline4)
        ],
      ),
    );
  }
}
