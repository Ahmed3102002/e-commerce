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
    apiKey: 'AIzaSyAFwH3pFIT6Cl7erC9cL9J4-Z-rDYhcun0',
    appId: '1:740175511168:web:8085363a046e558e6ab065',
    messagingSenderId: '740175511168',
    projectId: 'smart-store-2e22d',
    authDomain: 'smart-store-2e22d.firebaseapp.com',
    storageBucket: 'smart-store-2e22d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACjk0r36fmhQyfuzavpXUKvarTDj-yskk',
    appId: '1:740175511168:android:50bf2982a834b2bc6ab065',
    messagingSenderId: '740175511168',
    projectId: 'smart-store-2e22d',
    storageBucket: 'smart-store-2e22d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcvfOyINQk1WyWGeQJpgLHEuVBra6Iafo',
    appId: '1:740175511168:ios:5d234db4dd6be8456ab065',
    messagingSenderId: '740175511168',
    projectId: 'smart-store-2e22d',
    storageBucket: 'smart-store-2e22d.appspot.com',
    iosClientId: '740175511168-nlusii52rn13q09l9tl36jfrd6lstcen.apps.googleusercontent.com',
    iosBundleId: 'com.example.store',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcvfOyINQk1WyWGeQJpgLHEuVBra6Iafo',
    appId: '1:740175511168:ios:28a661e5c93d1e446ab065',
    messagingSenderId: '740175511168',
    projectId: 'smart-store-2e22d',
    storageBucket: 'smart-store-2e22d.appspot.com',
    iosClientId: '740175511168-l26fdnmebbsin222hup16v9b0ssncp3u.apps.googleusercontent.com',
    iosBundleId: 'com.example.store.RunnerTests',
  );
}