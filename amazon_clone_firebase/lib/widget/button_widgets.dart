// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomMainButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isLoading;
  final VoidCallback onPressed;
  const CustomMainButton(
      {super.key,
      required this.child,
      required this.color,
      required this.isLoading,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          fixedSize: Size(double.infinity, double.infinity),
          primary: Colors.white70,
        ),
        onPressed: onPressed,
        child: !isLoading
            ? child
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: CircularProgressIndicator(
                  color: Colors.white38,
                ),
              ));

    // return ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //         backgroundColor: color, fixedSize: Size(5, 10)),
    //     onPressed: onPressed,
    //     child: child);
  }
}
