// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCxFG-Dnwmyt_Vo0e3fRPn8iVL8Ihf5xp0',
    appId: '1:725831989948:web:1bb63e78ae3e8976e12eb9',
    messagingSenderId: '725831989948',
    projectId: 'fluttertest-bc391',
    authDomain: 'fluttertest-bc391.firebaseapp.com',
    databaseURL: 'https://fluttertest-bc391-default-rtdb.firebaseio.com',
    storageBucket: 'fluttertest-bc391.appspot.com',
    measurementId: 'G-7WRPYH6PT7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1MfpXqurnppq3aOD7nwyLzZiwdqTdx5o',
    appId: '1:725831989948:android:ba212fe069261e30e12eb9',
    messagingSenderId: '725831989948',
    projectId: 'fluttertest-bc391',
    databaseURL: 'https://fluttertest-bc391-default-rtdb.firebaseio.com',
    storageBucket: 'fluttertest-bc391.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPx8ULdwMxUjBydkhu5Z4XTf7qFA0WCjg',
    appId: '1:725831989948:ios:fdff3844821ecff5e12eb9',
    messagingSenderId: '725831989948',
    projectId: 'fluttertest-bc391',
    databaseURL: 'https://fluttertest-bc391-default-rtdb.firebaseio.com',
    storageBucket: 'fluttertest-bc391.appspot.com',
    androidClientId: '725831989948-l67818kjh6rmou52t84k6d781dh3a0p5.apps.googleusercontent.com',
    iosClientId: '725831989948-m1ev3nfmtcrjtq9p1q8teevd6612q60q.apps.googleusercontent.com',
    iosBundleId: 'com.example.newMemoryPlant',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPx8ULdwMxUjBydkhu5Z4XTf7qFA0WCjg',
    appId: '1:725831989948:ios:fdff3844821ecff5e12eb9',
    messagingSenderId: '725831989948',
    projectId: 'fluttertest-bc391',
    databaseURL: 'https://fluttertest-bc391-default-rtdb.firebaseio.com',
    storageBucket: 'fluttertest-bc391.appspot.com',
    androidClientId: '725831989948-l67818kjh6rmou52t84k6d781dh3a0p5.apps.googleusercontent.com',
    iosClientId: '725831989948-m1ev3nfmtcrjtq9p1q8teevd6612q60q.apps.googleusercontent.com',
    iosBundleId: 'com.example.newMemoryPlant',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCxFG-Dnwmyt_Vo0e3fRPn8iVL8Ihf5xp0',
    appId: '1:725831989948:web:4a62fc49ae591b6fe12eb9',
    messagingSenderId: '725831989948',
    projectId: 'fluttertest-bc391',
    authDomain: 'fluttertest-bc391.firebaseapp.com',
    databaseURL: 'https://fluttertest-bc391-default-rtdb.firebaseio.com',
    storageBucket: 'fluttertest-bc391.appspot.com',
    measurementId: 'G-BFGQL85524',
  );
}