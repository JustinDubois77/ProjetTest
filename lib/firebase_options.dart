import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    throw UnsupportedError(
      'DefaultFirebaseOptions are only configured for Web. '
      'Reconfigure using FlutterFire CLI to support other platforms.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyATwiaLtXdeT7ppYEbj-8T0MRSdvDKwfzQ",
      authDomain: "testfirebase-30c7f.firebaseapp.com",
      projectId: "testfirebase-30c7f",
      storageBucket: "testfirebase-30c7f.firebasestorage.app",
      messagingSenderId: "10299087558",
      appId: "1:10299087558:web:86b0bcdb31dacd58d7d5c7");
}
