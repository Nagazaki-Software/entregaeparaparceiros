import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDSs3eCKy_GKaoya4GVIvARvQTA3Tev5xg",
            authDomain: "entregaeparaparceiros-1it8zd.firebaseapp.com",
            projectId: "entregaeparaparceiros-1it8zd",
            storageBucket: "entregaeparaparceiros-1it8zd.firebasestorage.app",
            messagingSenderId: "851095426021",
            appId: "1:851095426021:web:d1a073ed6e44fd6ae8550c"));
  } else {
    await Firebase.initializeApp();
  }
}
