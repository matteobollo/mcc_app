// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDpY2CVjLyo-g6yBPdp-yg2OMurKIBxDKA',
    appId: '1:60015078952:web:c3a602e4bfd6fdccaa0f1d',
    messagingSenderId: '60015078952',
    projectId: 'mcc-app-438a6',
    authDomain: 'mcc-app-438a6.firebaseapp.com',
    storageBucket: 'mcc-app-438a6.appspot.com',
    measurementId: 'G-TMHZRC6HYD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABnGZlT-30P5FnRapnykl-ORmm-_-4d9g',
    appId: '1:60015078952:android:e6d934afcbdcbf26aa0f1d',
    messagingSenderId: '60015078952',
    projectId: 'mcc-app-438a6',
    storageBucket: 'mcc-app-438a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOKm1SY6GPkIcXcSsqQwrUft4QktK1fhE',
    appId: '1:60015078952:ios:f02a87241bd16947aa0f1d',
    messagingSenderId: '60015078952',
    projectId: 'mcc-app-438a6',
    storageBucket: 'mcc-app-438a6.appspot.com',
    iosClientId: '60015078952-npdm88rdkkmqtah3401dpquoearr4pem.apps.googleusercontent.com',
    iosBundleId: 'com.example.mcc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOKm1SY6GPkIcXcSsqQwrUft4QktK1fhE',
    appId: '1:60015078952:ios:f02a87241bd16947aa0f1d',
    messagingSenderId: '60015078952',
    projectId: 'mcc-app-438a6',
    storageBucket: 'mcc-app-438a6.appspot.com',
    iosClientId: '60015078952-npdm88rdkkmqtah3401dpquoearr4pem.apps.googleusercontent.com',
    iosBundleId: 'com.example.mcc',
  );
}
