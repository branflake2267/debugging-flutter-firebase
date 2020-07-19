import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoadFirebase());
  }
}

class LoadFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return LoadingError();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Loaded();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class Loaded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Container(color: const Color(0xFF2DBD3A), child: Text('Works...')));
  }
}

class LoadingError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: const Color(0xFF2DBD3A),
            child: Text('Loading problem... Please try again...')));
  }
}
