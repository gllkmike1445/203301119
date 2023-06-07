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
    apiKey: 'AIzaSyBtcs46QQHuYEuIsvtvSVHTzrB5k_LqN7w',
    appId: '1:677738848983:web:962c7352958aa1d3fb4692',
    messagingSenderId: '677738848983',
    projectId: 'chatbyme-451e3',
    authDomain: 'chatbyme-451e3.firebaseapp.com',
    storageBucket: 'chatbyme-451e3.appspot.com',
    measurementId: 'G-WF8RL4EJE1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCB05ydzlN6IgvxsQ_SWhLVnMFfJ3nVK8Y',
    appId: '1:677738848983:android:6b15bd7010a7b004fb4692',
    messagingSenderId: '677738848983',
    projectId: 'chatbyme-451e3',
    storageBucket: 'chatbyme-451e3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBws8z53xWM6Cs0WswB66zIlyuivnKlejs',
    appId: '1:677738848983:ios:8cfeff45b5edfde4fb4692',
    messagingSenderId: '677738848983',
    projectId: 'chatbyme-451e3',
    storageBucket: 'chatbyme-451e3.appspot.com',
    iosClientId: '677738848983-hia9an2u00fm1vttc59dun8fulioq30n.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatByMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBws8z53xWM6Cs0WswB66zIlyuivnKlejs',
    appId: '1:677738848983:ios:8cfeff45b5edfde4fb4692',
    messagingSenderId: '677738848983',
    projectId: 'chatbyme-451e3',
    storageBucket: 'chatbyme-451e3.appspot.com',
    iosClientId: '677738848983-hia9an2u00fm1vttc59dun8fulioq30n.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatByMe',
  );
}