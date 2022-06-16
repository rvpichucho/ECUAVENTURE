import 'package:ecuaventure/src/pages/data_foto_page.dart';
import 'package:ecuaventure/src/pages/login_page.dart';
import 'package:ecuaventure/src/pages/reservation_page.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/icon.png'),
                ),
                const Text(
                  "ECUadventure",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: color_const.blueC,
            ),
          ),
          ListTile(
            leading: Icon(Icons.list_alt_outlined,
                color: Theme.of(context).primaryColorDark),
            title: Text(AppLocalizations.of(context)!.my_reservation),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReservationPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.remember_me_outlined,
                color: Theme.of(context).primaryColorDark),
            title: const Text("Datos"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FotoPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined,
                color: Theme.of(context).primaryColorDark),
            title: Text(AppLocalizations.of(context)!.get_out),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
