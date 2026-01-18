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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCBP7zFfWl-Q7e6_3sFb2kpvVTOwOCSfP8',
    appId: '1:410036514251:web:68477b24e4e34210251a4e',
    messagingSenderId: '410036514251',
    projectId: 'if23b-d45a7',
    authDomain: 'if23b-d45a7.firebaseapp.com',
    storageBucket: 'if23b-d45a7.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoyFUt2fa9H0FlspnYsQVoAQRSjfcBAYA',
    appId: '1:410036514251:android:cd50a1a3f81cc244251a4e',
    messagingSenderId: '410036514251',
    projectId: 'if23b-d45a7',
    storageBucket: 'if23b-d45a7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDV6W4lz1tRkXPIUTN1wRrHwF2QygY1yg',
    appId: '1:410036514251:ios:5616e68c09d95f86251a4e',
    messagingSenderId: '410036514251',
    projectId: 'if23b-d45a7',
    storageBucket: 'if23b-d45a7.firebasestorage.app',
    iosBundleId: 'com.example.portalEskul',
  );
}
