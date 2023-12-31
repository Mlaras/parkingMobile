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
    apiKey: 'AIzaSyBPZOyvkGgH3h_4rAnOVXmmsFw-VQ4rdp4',
    appId: '1:986114658615:web:7d9ee78f317af5e9828ab2',
    messagingSenderId: '986114658615',
    projectId: 'ml-parking-app',
    authDomain: 'ml-parking-app.firebaseapp.com',
    storageBucket: 'ml-parking-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBA9-ojMS-OhEXyU1LQKj-XTAuMP0IJt8o',
    appId: '1:986114658615:android:3ba5381b7226de80828ab2',
    messagingSenderId: '986114658615',
    projectId: 'ml-parking-app',
    storageBucket: 'ml-parking-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyGGfV5OcTuZPuzib3wPE9LMj2wPMab40',
    appId: '1:986114658615:ios:46dbc4ce4f8e6237828ab2',
    messagingSenderId: '986114658615',
    projectId: 'ml-parking-app',
    storageBucket: 'ml-parking-app.appspot.com',
    androidClientId: '986114658615-gc1j54kdtc6qlqp4a22kf1uhr1vnrore.apps.googleusercontent.com',
    iosBundleId: 'com.example.parkingcode',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCyGGfV5OcTuZPuzib3wPE9LMj2wPMab40',
    appId: '1:986114658615:ios:8dcbc58fb9e2b2a8828ab2',
    messagingSenderId: '986114658615',
    projectId: 'ml-parking-app',
    storageBucket: 'ml-parking-app.appspot.com',
    androidClientId: '986114658615-gc1j54kdtc6qlqp4a22kf1uhr1vnrore.apps.googleusercontent.com',
    iosBundleId: 'com.example.parkingcode.RunnerTests',
  );
}
