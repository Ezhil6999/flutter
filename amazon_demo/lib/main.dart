import 'package:amazon_demo/features/auth/screens/auth_screen.dart';
import 'package:amazon_demo/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:amazon_demo/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const Demoapp()));
}

class Demoapp extends StatelessWidget {
  const Demoapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: ((settings) {
        return generateRouter(settings);
      }),
      home: const AuthScreen(),
    );
  }
}
