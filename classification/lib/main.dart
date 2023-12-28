import 'package:flutter/material.dart';
import 'dart:core';
import 'submissionScreen.dart';
import 'homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/submissionScreen': (context) => const SubmissionScreen(
              oName: '',
              uID: '',
              rID: '',
            ),
      },
    );
  }
}
