import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class textEditingWidgets extends StatefulWidget {
  final String title;
  final TextEditingController controllers;
  final bool obscureTest;
  const textEditingWidgets(
      {super.key,
      required this.title,
      required this.controllers,
      required this.obscureTest});

  @override
  State<textEditingWidgets> createState() => _textEditingWidgetsState();
}

class _textEditingWidgetsState extends State<textEditingWidgets> {
  late FocusNode focusNode;
  bool isInFocus = false;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isInFocus = true;
        });
      } else {
        setState(() {
          isInFocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        isInFocus
            ? const BoxShadow(
                blurRadius: 20, spreadRadius: 1, color: Colors.grey)
            : const BoxShadow(
                blurRadius: 20, spreadRadius: 1, color: Colors.white)
      ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
          validator: (v) {
            if (v == null || v.isEmpty) {
              return "Wrong value";
            } else
              print(v);
          },
          focusNode: focusNode,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: widget.title,
              hintText: widget.title,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          obscureText: widget.obscureTest,
          controller: widget.controllers,
        ),
      ),
    );
  }
}
