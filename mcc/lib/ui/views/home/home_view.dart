import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcc/ui/views/contact/contact_view.dart';
import 'package:mcc/ui/views/site/site_view.dart';
import 'package:mcc/ui/views/subscribe/subscribe_view.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:stacked/stacked.dart';
import '../calendar/calendar_view.dart';
import '../login/loginscreen_view.dart';
import '../login/loginscreen_viewmodel.dart';
import 'home_viewmodel.dart';
import 'package:quickalert/models/quickalert_type.dart';

bool showselect = false;

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    HomeViewModel viewModel = HomeViewModel();
    return Scaffold(
        backgroundColor: Colors.orange[400],
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Centro Estivo M.C.C.',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.orange[400],
          elevation: 0,
        ),
        body: Container(
          child: Container(
            height: 800,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 30),
                  child: Row(
                    children: [
                      Text(
                        viewModel.getText(),
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image(
                            image: AssetImage('assets/images/LogoMCC.png'),
                            width: 55),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, top: 30),
                    child: Row(
                      children: [
                        FutureBuilder(
                            future: viewModel.getDatafromGoogleSheet(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.data != null) {
                                if (snapshot.data.first.isOpen == 'si') {
                                  return GestureDetector(
                                    child: _cardInfo(Colors.orange[400]!,
                                        'L\'estate è alle porte!', 'Iscriviti ora'),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const SubscribeView()));
                                    },
                                  );
                                } else{
                                  return GestureDetector(
                                    child: _cardInfo(Colors.orange[400]!,
                                        'Buona estate a tutti!', 'Team M.C.C.'),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const SubscribeView()));
                                    },
                                  );
                                }
                              } else{
                                return const CircularProgressIndicator(
                                  color: Colors.orange,
                                  backgroundColor: Color(0xFF555556),
                                );
                              }
                            }),
                        GestureDetector(
                          child: _cardInfo(Colors.teal[400]!, 'Calendario MCC!',
                              'Non perderti nessun evento'),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CalendarViewScreen()));
                          },
                        ),
                        GestureDetector(
                          child: _cardInfo(Colors.indigo[400]!, 'Nuovo Sito!',
                              'Clicca qui per vederlo'),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const SiteView()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Funzionalità',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          height: 250,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.30,
                            children: [
                              GestureDetector(
                                child: _cardButton('assets/images/calendar.png',
                                    'Calendario Eventi'),
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CalendarViewScreen()));
                                },
                              ),
                              GestureDetector(
                                child: _cardButton(
                                    'assets/images/site.png', 'Sito'),
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SiteView()));
                                },
                              ),
                              FutureBuilder(
                                future: viewModel.getDatafromGoogleSheet(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.data != null) {
                                    if (snapshot.data.first.isOpen == 'si') {
                                      return GestureDetector(
                                        child: _cardButton(
                                            'assets/images/subscribe.png',
                                            'Iscrizioni'),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SubscribeView()));
                                        },
                                      );
                                    } else {
                                      return GestureDetector(
                                        child: _cardButton(
                                            'assets/images/contact.png',
                                            'Contattaci'),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ContactView()));
                                        },
                                      );
                                    }
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.orange,
                                        backgroundColor: Color(0xFF555556),
                                      ),
                                    );
                                  }
                                },
                              ),
                              GestureDetector(
                                child: _cardButton(
                                    'assets/images/door.png', 'Esci'),
                                onTap: () {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.confirm,
                                    title: 'Sei sicuro?',
                                    text: 'Vuoi uscire dalla nostra app',
                                    confirmBtnText: 'No',
                                    cancelBtnText: 'Si',
                                    showCancelBtn: true,
                                    onCancelBtnTap: () async {
                                      await FirebaseAuth.instance.signOut();
                                      await googleSI.signOut();
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreenView()));
                                    },
                                    confirmBtnColor: Colors.red,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                      color: Colors.orange[300],
                      child: Text(
                        'Per problemi all\'app contattare: matteo.bollo2001@gmail.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

Widget _cardInfo(Color color, String title, String subtitle) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    padding: EdgeInsets.only(left: 20),
    height: 120,
    width: 240,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        )
      ],
    ),
  );
}

Widget _cardButton(String image, String name) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 2),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 17),
        )
      ],
    ),
  );
}
