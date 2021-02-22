import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseInitialize {
  static FirebaseApp app;
  static FirebaseDatabase database;
  static Map<dynamic, dynamic> playMarketLink;
  static Map<dynamic, dynamic> appStoreLink;

  Future<void> initializeFirebase() async {
    app = await Firebase.initializeApp(
      name: 'uzmobile',
      options: Platform.isIOS
          ? FirebaseOptions(
              appId: '1:1087274318748:ios:2591339e5ff46699062659',
              apiKey: 'AIzaSyCuHHnzYZ2e0egWx28grok87LAjZjPxluA',
              projectId: 'uzmobile2',
              messagingSenderId: 'uzmobile2__app',
              databaseURL: 'https://uzmobile2-default-rtdb.firebaseio.com/',
            )
          : FirebaseOptions(
              appId: "1:701139912025:android:70af370bcaf772be62f848",
              apiKey: "AIzaSyDuvdapl1-NFxw0QWVIGyl1Z1CazElNIuE",
              messagingSenderId: 'uzmobile2__app',
              projectId: "uzmobile2-f04e7",
              databaseURL:
                  "https://uzmobile2-f04e7-default-rtdb.firebaseio.com/",
            ),
    );
    database = FirebaseDatabase(app: app);
    await database.setPersistenceEnabled(true);
    await database.setPersistenceCacheSizeBytes(2000000);
    var dbRef = database.reference().child("AppStoreLink");
    dbRef.once().then((DataSnapshot snapshot) {
      playMarketLink = Map<dynamic, dynamic>.from(snapshot.value);
    });
    var dbRef2 = database.reference().child("PlayMarketLink");
    dbRef2.once().then((DataSnapshot snapshot) {
      playMarketLink = Map<dynamic, dynamic>.from(snapshot.value);
    });
  }
}
