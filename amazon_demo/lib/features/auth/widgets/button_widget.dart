import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  VoidCallback onpressed;
  String child;
  ButtonWidget({super.key, required this.onpressed, required this.child});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
          ),
          onPressed: widget.onpressed,
          child: Text(
            widget.child,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
