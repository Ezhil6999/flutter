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
  late StreamSubscription internetConnection;
  bool hasInternet = false;
  @override
  void initState() {
    super.initState();
    internetConnection =
        InternetConnectionChecker().onStatusChange.listen((event) {
      hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        this.hasInternet = hasInternet;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("E Z H I L"),
          centerTitle: true,
          elevation: 20,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.blueGrey],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Check the Internet Connectivity",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              buildInternetStatus(),
            ],
          ),
        ),
      ),
    );
  }

  Column buildInternetStatus() {
    return Column(
      children: [
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
