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
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async{
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        SfGlobalLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const[
        Locale('it')
      ],
      locale: Locale('it'),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}

class ItalianLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const ItalianLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'it';

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      const DefaultMaterialLocalizations();

  @override
  bool shouldReload(LocalizationsDelegate<MaterialLocalizations> old) =>
      false;
}
