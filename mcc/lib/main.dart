import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mcc/app/app.bottomsheets.dart';
import 'package:mcc/app/app.dialogs.dart';
import 'package:mcc/app/app.locator.dart';
import 'package:mcc/app/app.router.dart';
import 'package:mcc/authentication_service.dart';
import 'package:mcc/firebase_options.dart';
import 'package:mcc/ui/common/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async{
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MCC',
      home: locator<AuthenticationService>().handleAuthState(),
      theme: Theme.of(context).copyWith(
        primaryColor: kcBackgroundColor,
        focusColor: kcPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
        ),
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
