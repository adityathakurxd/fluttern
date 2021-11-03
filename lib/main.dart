import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttern/constants/constants.dart';
import 'package:fluttern/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Team Aditya',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.from(
              colorScheme: ColorScheme.light(
                primary: kPrimaryColor,
                secondary: kAccentColor,
              ),
            ),
            home: const HomeScreen(),
          );
        }
        return CircularProgressIndicator();
      },
    );

  }
}
