import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:innostack/screens/art_detail_screen.dart';
import 'package:innostack/screens/artworks_screen.dart';
import 'package:innostack/screens/auth_screen.dart';
import 'package:innostack/screens/my_location_screen.dart';
import 'package:innostack/ui/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InnoStack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Splash();
          }
          if (userSnapshot.hasData) {
            return const MyLocationScreen();
          }
          return const AuthScreen();
        },
      ),
      routes: {
        ArtworksScreen.routeName: (ctx) => const ArtworksScreen(),
        ArtDetailScreen.routeName: (ctx) => const ArtDetailScreen(),
      },
    );
  }
}
