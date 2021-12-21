import 'package:ecuaventure/src/components/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/pages/motorcycle_page.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as Colorconst;

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colorconst.BLUE,
          centerTitle: true,
          title: const Text(
            "MENU",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      drawer: const MenuLateral(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colorconst.BEIGE, // background color
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ListMotorcycle(),
                    ListSquares(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ListBikes(),
                    ListBuggys(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListMotorcycle extends StatelessWidget {
  const ListMotorcycle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MotorcyclePage()));
          },
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width / 2 -
                32, // minus 32 due to the margin
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.yellow[100],
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
              mainAxisAlignment:
                  MainAxisAlignment.end, // posion the everything to the bottom
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/Destacado.png'),
                const Text(
                  "Motos",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListSquares extends StatelessWidget {
  const ListSquares({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MotorcyclePage()));
          },
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width / 2 -
                32, // minus 32 due to the margin
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.yellow[100],
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
              mainAxisAlignment:
                  MainAxisAlignment.end, // posion the everything to the bottom
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/rocket250-1.png'),
                const Text(
                  "Cuadrones",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListBikes extends StatelessWidget {
  const ListBikes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MotorcyclePage()));
          },
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width / 2 -
                32, // minus 32 due to the margin
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.yellow[100],
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
              mainAxisAlignment:
                  MainAxisAlignment.end, // posion the everything to the bottom
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/Destacado.png'),
                const Text(
                  "Bicicletas",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListBuggys extends StatelessWidget {
  const ListBuggys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MotorcyclePage()));
          },
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width / 2 -
                32, // minus 32 due to the margin
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.yellow[100],
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
              mainAxisAlignment:
                  MainAxisAlignment.end, // posion the everything to the bottom
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                    'assets/kids-two-seater-pink-4wd-large-electric-buggy.png'),
                const Text(
                  "Buggys",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
