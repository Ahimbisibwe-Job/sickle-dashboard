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
    apiKey: 'AIzaSyDbX_lgn9Xy86SpbbnlHps0vjrZqX7HzHc',
    appId: '1:741530247032:web:bf118fdcd2b58f40c2728d',
    messagingSenderId: '741530247032',
    projectId: 'healthybuddy-f4e23',
    authDomain: 'healthybuddy-f4e23.firebaseapp.com',
    storageBucket: 'healthybuddy-f4e23.appspot.com',
    measurementId: 'G-HGFJR5WMKT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4S6syaER6B4dRbEv0nKIqkHQdlf3ADjY',
    appId: '1:741530247032:android:f6464e36ce9a3e96c2728d',
    messagingSenderId: '741530247032',
    projectId: 'healthybuddy-f4e23',
    storageBucket: 'healthybuddy-f4e23.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0FyZUxZa64W7eECGqMETpfBQofnu8ulg',
    appId: '1:741530247032:ios:c05d34b88ccf3db5c2728d',
    messagingSenderId: '741530247032',
    projectId: 'healthybuddy-f4e23',
    storageBucket: 'healthybuddy-f4e23.appspot.com',
    iosClientId: '741530247032-q5dtqjaerja77okvjhbllhf9o62aq8on.apps.googleusercontent.com',
    iosBundleId: 'com.dashboard.flutter.app.flutterDashboard',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0FyZUxZa64W7eECGqMETpfBQofnu8ulg',
    appId: '1:741530247032:ios:c05d34b88ccf3db5c2728d',
    messagingSenderId: '741530247032',
    projectId: 'healthybuddy-f4e23',
    storageBucket: 'healthybuddy-f4e23.appspot.com',
    iosClientId: '741530247032-q5dtqjaerja77okvjhbllhf9o62aq8on.apps.googleusercontent.com',
    iosBundleId: 'com.dashboard.flutter.app.flutterDashboard',
  );
}