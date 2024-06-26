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
    apiKey: 'AIzaSyDu0vUaXfkb9WKmGRaa7sfixaxIKpfZS58',
    appId: '1:891912571746:web:ff04bde1a1917ea318ba3b',
    messagingSenderId: '891912571746',
    projectId: 'blood-donation-cc718',
    authDomain: 'blood-donation-cc718.firebaseapp.com',
    storageBucket: 'blood-donation-cc718.appspot.com',
    measurementId: 'G-FXY4L2DS8E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCM1eA1A8-yEdlLUEbp_qZ-p5NjkMdp9Qs',
    appId: '1:891912571746:android:c7d00538d4cc712e18ba3b',
    messagingSenderId: '891912571746',
    projectId: 'blood-donation-cc718',
    storageBucket: 'blood-donation-cc718.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfETnhuOJhB7KdeRBQ-g1wGo4yvtcU_AU',
    appId: '1:891912571746:ios:212bd9415b0f347a18ba3b',
    messagingSenderId: '891912571746',
    projectId: 'blood-donation-cc718',
    storageBucket: 'blood-donation-cc718.appspot.com',
    iosBundleId: 'com.example.bloodDonationApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfETnhuOJhB7KdeRBQ-g1wGo4yvtcU_AU',
    appId: '1:891912571746:ios:5bb585a93f6773be18ba3b',
    messagingSenderId: '891912571746',
    projectId: 'blood-donation-cc718',
    storageBucket: 'blood-donation-cc718.appspot.com',
    iosBundleId: 'com.example.bloodDonationApp.RunnerTests',
  );
}
