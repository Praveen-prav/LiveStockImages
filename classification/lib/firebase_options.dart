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
    apiKey: 'AIzaSyBlUAkCB8Il_MfC9cNkrcLydduRkx4WcJw',
    appId: '1:240095002638:web:ab5f56ea117d3fb4317c5f',
    messagingSenderId: '240095002638',
    projectId: 'store-media-9b9bd',
    authDomain: 'store-media-9b9bd.firebaseapp.com',
    storageBucket: 'store-media-9b9bd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-r_8GT48UVda6p7-Rp9vyFiEs8nsnX4M',
    appId: '1:240095002638:android:d6b7fa6eca34818e317c5f',
    messagingSenderId: '240095002638',
    projectId: 'store-media-9b9bd',
    storageBucket: 'store-media-9b9bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQAVXOzHCuTpIH6fvjPqoriMj-ThkIheo',
    appId: '1:240095002638:ios:154a241b0ed60da4317c5f',
    messagingSenderId: '240095002638',
    projectId: 'store-media-9b9bd',
    storageBucket: 'store-media-9b9bd.appspot.com',
    iosBundleId: 'com.example.classification',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQAVXOzHCuTpIH6fvjPqoriMj-ThkIheo',
    appId: '1:240095002638:ios:777a99bb2b4f9b66317c5f',
    messagingSenderId: '240095002638',
    projectId: 'store-media-9b9bd',
    storageBucket: 'store-media-9b9bd.appspot.com',
    iosBundleId: 'com.example.classification.RunnerTests',
  );
}
