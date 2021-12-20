
import 'package:ecuaventure/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange[100], // background color
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16.0, top: 20.0),
              child: Text("MENU", style: TextStyle(color: Colors.blue[900], fontSize: 24.0, fontWeight: FontWeight.bold)),
            ),
           const Boton(),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width / 2 - 32, // minus 32 due to the margin
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100], // background color of the cards
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0.5,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                   
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end, // posion the everything to the bottom
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //onPressed: () {
                        //Navigator.push(context,
                            //MaterialPageRoute(builder: (context) => HomePage()));
                      //},
        
                      children: [
                        Image.asset('assets/Destacado.png'),
                        Text("Motos", style: TextStyle(fontSize: 20.0, color: Colors.brown, fontWeight: FontWeight.bold)),
                        
                      ],
                      
                    ),
                    
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width / 2 - 32, // minus 32 due to the margin
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100], // background color of the cards
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: const [
                        // this is the shadow of the card
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0.5,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end, // posion the everything to the bottom
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        // place here your image
                        Image.asset('assets/rocket250-1.png'),
                        Text("Cuadrones", style: TextStyle(fontSize: 20.0, color: Colors.brown, fontWeight: FontWeight.bold)),
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
           
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width / 2 - 32, // minus 32 due to the margin
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100], // background color of the cards
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: const [
                        // this is the shadow of the card
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0.5,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end, // posion the everything to the bottom
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        // place here your image
                        Text("Bicicletas", style: TextStyle(fontSize: 20.0, color: Colors.brown, fontWeight: FontWeight.bold)),
                        
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width / 2 - 32, // minus 32 due to the margin
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100], // background color of the cards
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: const [
                        // this is the shadow of the card
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0.5,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end, // posion the everything to the bottom
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children:[
                        // place here your image
                        Image.asset('assets/kids-two-seater-pink-4wd-large-electric-buggy.png'),
                        Text("Buggis", style: TextStyle(fontSize: 20.0, color: Colors.brown, fontWeight: FontWeight.bold)),
                       
                       
                      ],
                    ),
                    
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Boton extends StatelessWidget {
  const Boton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return MaterialButton(
          color:Colors.amber,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(
              builder: (context) => const HomePage()),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
            child: const Text(
              'Registrar Motorizado',
              style: TextStyle(color:Colors.black),
            ),
          ),
          
        );
      },
    );
  }
}

