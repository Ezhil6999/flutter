import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  final String context;
  final bool obscuretext;

  TextFieldWidget(
      {super.key,
      required this.context,
      required this.controller,
      required this.obscuretext});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
          obscureText: widget.obscuretext,
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: widget.context,
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Enter your ${widget.context}';
            }
            return null;
          },
        ));
  }
}
