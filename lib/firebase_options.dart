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
    apiKey: 'AIzaSyAyEzVXrmCqD4ucTvV86pwq-kZSn8jjR_0',
    appId: '1:13081327953:web:2de3ce724593d492c03b70',
    messagingSenderId: '13081327953',
    projectId: 'expense2-da08e',
    authDomain: 'expense2-da08e.firebaseapp.com',
    storageBucket: 'expense2-da08e.appspot.com',
    measurementId: 'G-KCHGW881VG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-kmpnp87wnflRsSQTW35QSN1jYoxr3uA',
    appId: '1:13081327953:android:9a50f5eca430b741c03b70',
    messagingSenderId: '13081327953',
    projectId: 'expense2-da08e',
    storageBucket: 'expense2-da08e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpUG8PLNEY3V9NQ_z9nA5_IFPoD9HJKRE',
    appId: '1:13081327953:ios:1766e83ee1fabf3ec03b70',
    messagingSenderId: '13081327953',
    projectId: 'expense2-da08e',
    storageBucket: 'expense2-da08e.appspot.com',
    iosBundleId: 'com.example.expensesTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpUG8PLNEY3V9NQ_z9nA5_IFPoD9HJKRE',
    appId: '1:13081327953:ios:1766e83ee1fabf3ec03b70',
    messagingSenderId: '13081327953',
    projectId: 'expense2-da08e',
    storageBucket: 'expense2-da08e.appspot.com',
    iosBundleId: 'com.example.expensesTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAyEzVXrmCqD4ucTvV86pwq-kZSn8jjR_0',
    appId: '1:13081327953:web:a0ff44f8f2079227c03b70',
    messagingSenderId: '13081327953',
    projectId: 'expense2-da08e',
    authDomain: 'expense2-da08e.firebaseapp.com',
    storageBucket: 'expense2-da08e.appspot.com',
    measurementId: 'G-KG486KV59J',
  );

}