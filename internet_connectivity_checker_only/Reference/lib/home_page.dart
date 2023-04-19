import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription subscription;
  late StreamSubscription internetSubscription;
  bool hasInternet = false;
  @override
  void initState() {
    super.initState();
    subscription =
        Connectivity().onConnectivityChanged.listen(_showConnectivitySnackBar);
    internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((event) {
      hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        this.hasInternet = hasInternet;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connectivity Plus"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildInternetStatus(),
            ElevatedButton(
                onPressed: () async {
                  final result = await Connectivity().checkConnectivity();
                  _showConnectivitySnackBar(result);
                },
                child: const Text("Check Connectivity"))
          ],
        ),
      ),
    );
  }

  void _showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
        ? result == ConnectivityResult.mobile
            ? 'You are connected to Mobile Network'
            : 'you are connected to wifi Network'
        : 'you have no Internet';
    final Color color = hasInternet ? Colors.green : Colors.red;
    _showSnackBar(context, message, color);
  }

  void _showSnackBar(BuildContext context, String? message, Color colors) {
    final snackBar = SnackBar(
      content: Text(message!),
      backgroundColor: colors,
    );
  }

  Column buildInternetStatus() {
    return Column(
      children: [
        const Text(
          "Connection Status",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              hasInternet ? Icons.done : Icons.error,
              color: hasInternet ? Colors.green : Colors.red,
              size: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(hasInternet ? 'Internet Available ' : 'No Internet Available')
          ],
        )
      ],
    );
  }
}
