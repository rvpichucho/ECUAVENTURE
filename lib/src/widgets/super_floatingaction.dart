import 'package:ecuaventure/src/providers/provider_moto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BotonMoto extends StatelessWidget {
  const BotonMoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final motoinfo =Provider.of<MotoProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget> [
        FloatingActionButton(
          child: const Icon(Icons.access_time),
          backgroundColor: Colors.red,
          onPressed:() =>motoinfo.moto ='hola', 
          
        ),
        const SizedBox(height: 10.0,),
        FloatingActionButton(
          child: const Icon(Icons.account_balance),
          backgroundColor: Colors.blue,
          onPressed: ()=>motoinfo.moto ="Ya no vale",
        ),
      ],
    );
  }
}