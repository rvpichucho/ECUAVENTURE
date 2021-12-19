import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:ecuaventure/src/services/motorcycle_service.dart';
import 'package:ecuaventure/src/widgets/motorcycle_card.dart';

import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
 const HomePage({Key? key}) : super(key: key);

  @override
   HomePageState createState() =>  HomePageState();
}

class  HomePageState extends State <HomePage> {
  final ServiceMotorcycle _service = ServiceMotorcycle();
  List<Motorcycles>? _listCar;
  @override
  
  void initState() {
    super.initState();
    _downloadContent();
  }


  @override
  Widget build(BuildContext context) {
    return _listCar==null ?
    const Center(
      child: SizedBox(
        height: 50.0,width: 50.0,child: CircleAvatar(),
      ),
    )
    :_listCar!.isEmpty 
    ? const Center(child: SizedBox(child: Text('No hay datos dentro del servicio'))
    )
    :Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 7.0),
      child: ListView(
        children: _listCar!
        .map((e) => MotorcyclesCard(model: e)).toList()));
  }
  _downloadContent(){
    _service.getMotorcycle().then((value){
      _listCar=value;
      setState(() {
        
      });
    }
    );
  }
}



