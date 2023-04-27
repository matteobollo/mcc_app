import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:mcc/ui/common/app_colors.dart';
import 'package:mcc/ui/common/ui_helpers.dart';
import '../../component/navigationdrawer_appbar.dart';
import 'home_viewmodel.dart';

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
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Home',
          style: TextStyle(
            fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.orange[400],
        elevation: 0,
      ),
      drawer: NavigationDrawerCustom(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(child: Image(image: AssetImage('assets/images/LogoMCC.png'), width: 180)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      color: Colors.orange[300],
                      height: 40,
                      width: 200,
                      child: Center(
                        child: Text(
                          viewModel.getText(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:10, left:10, right:10),
                  child: Container(
                    height: 2,
                    color: Colors.orange,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Container(
                    child: Text(
                      'Novità in evidenza',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Container(
                      height: 200,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: SvgPicture.asset('assets/images/conference.svg'),
                              )
                          ),
                          Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [Color(0x1A000000), Color(0x99000000)],
                                        stops: [0, 1])),
                              )),
                          Positioned(
                            bottom: 16,
                            left: 15,
                            right: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    width: 280,
                                    color: Colors.grey[500],
                                    child: Center(
                                      child: Text('Presentazione Centro Estivo',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.white
                                          ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: 130,
                                color: Colors.grey[500],
                                child: Center(
                                  child: Text(
                                      '19/05 alle 21:00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        height: 200,
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SvgPicture.asset('assets/images/subscriptions.svg'),
                                )
                            ),
                            Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [Color(0x1A000000), Color(0x99000000)],
                                          stops: [0, 1])),
                                )),
                            Positioned(
                              bottom: 16,
                              left: 15,
                              right: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      width: 180,
                                      color: Colors.grey[500],
                                      child: Center(
                                        child: Text('Iscrizioni Aperte!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: Colors.white
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
          )
      ),
    )
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}