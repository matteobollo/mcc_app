import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mcc/ui/views/calendar/calendar_view.dart';
import 'package:mcc/ui/views/home/home_view.dart';
import 'package:mcc/ui/views/subscribe/subscribe_view.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../views/calendar/calendar_viewmodel.dart';
import '../views/login/loginscreen_viewmodel.dart';
import '../views/site/site_view.dart';

class NavigationDrawerCustom extends StatelessWidget{

  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
          buildMenuItems(context)
        ],
      )
    ),
  );
}

Widget buildHeader(BuildContext context) => ClipRRect(
  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
  child: Container(
    color: Colors.orange[300],
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Container(
        height: 80,
        child: Image(image: AssetImage('assets/images/LogoMCC.png'), width: 80)
    ),
  ),
);

Widget buildMenuItems(BuildContext context) => Container(
  padding: const EdgeInsets.all(24),
  child: Wrap(
    runSpacing: 10,
    children: [
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Home'),
        onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeView())),
      ),
      ListTile(
        leading: const Icon(Icons.calendar_month_outlined),
        title: const Text('Calendario'),
        onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CalendarViewScreen())),
      ),
      ListTile(
        leading: const Icon(Icons.language_outlined),
        title: const Text('Sito'),
        onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SiteView())),
      ),
      const Divider(color: Colors.black54),
      ListTile(
        leading: const Icon(Icons.person_add_alt_1_outlined),
        title: const Text('Iscriviti'),
        onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SubscribeView())),
      ),
      const Divider(color: Colors.black54),
      ListTile(
        leading: const Icon(Icons.logout_outlined),
        title: const Text('Esci'),
        onTap: (){
          QuickAlert.show(
            context: context,
            type: QuickAlertType.confirm,
            title: 'Sei sicuro?',
            text: 'Vuoi uscire dalla nostra app',
            confirmBtnText: 'No',
            cancelBtnText: 'Si',
            showCancelBtn: true,
            onCancelBtnTap: () async{
              await FirebaseAuth.instance.signOut();
              await googleSI.signOut();
            } ,
            confirmBtnColor: Colors.red,
          );
        },
      ),
    ],
  ),
);
