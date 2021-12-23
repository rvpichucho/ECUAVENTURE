import 'package:ecuaventure/src/providers/provider_menu.dart';
import 'package:ecuaventure/src/utils/menu_inferior.dart';
//import 'package:ecuaventure/src/widgets/motorcycle_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      //body: const MotorcycleWidget(),
      body: contentWidgets[mainProvider.index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            mainProvider.index = index;
          },
          type: BottomNavigationBarType.fixed,
          items: menuOptions
              .map((e) => BottomNavigationBarItem(
                  label: e.label,
                  icon: Icon(
                    e.icon,
                    color: color_const.blueC,
                  )))
              .toList(),
          currentIndex: mainProvider.index),
    );
  }
}
