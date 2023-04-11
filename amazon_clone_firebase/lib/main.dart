import 'package:amazon_clone_firebase/utils/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone_firebase/screens/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCPBY7Z6_93auot3nFMmTVpxGns6nz4S6k",
            authDomain: "ezhil-app-b32fe.firebaseapp.com",
            projectId: "ezhil-app-b32fe",
            storageBucket: "ezhil-app-b32fe.appspot.com",
            messagingSenderId: "641912486272",
            appId: "1:641912486272:web:bd817b78f8a4448eb8e965"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amzon Clone FireBase',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> user) {
            if (user.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (user.hasData) {
              //FirebaseAuth.instance.signOut();
              return ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text("Sign out"));
            } else {
              return const SignInScreen();
            }
          }),
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
    );
  }
}
