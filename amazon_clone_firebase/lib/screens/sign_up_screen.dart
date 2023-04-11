import 'dart:math';

import 'package:amazon_clone_firebase/resourse/authentication_method.dart';
import 'package:amazon_clone_firebase/utils/utils.dart';
import 'package:amazon_clone_firebase/widget/button_widgets.dart';
import 'package:amazon_clone_firebase/widget/text_field_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:amazon_clone_firebase/screens/sign_in_screen.dart ';
import 'package:flutter/src/widgets/placeholder.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _newkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  AuthenticationMethod authenticationMethod = AuthenticationMethod();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    addresscontroller.dispose();
    namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/img/Ezhil.jpg'),
                  height: 130,
                ),
                Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: Form(
                    key: _newkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Sign-Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black87),
                        ),
                        textEditingWidgets(
                            title: 'Name',
                            controllers: namecontroller,
                            obscureTest: false),
                        textEditingWidgets(
                            title: 'Address',
                            controllers: addresscontroller,
                            obscureTest: false),
                        textEditingWidgets(
                            title: 'Email',
                            controllers: emailcontroller,
                            obscureTest: false),
                        textEditingWidgets(
                            title: 'Password',
                            controllers: passwordcontroller,
                            obscureTest: true),
                        CustomMainButton(
                            color: Colors.black87,
                            isLoading: false,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              Future.delayed(Duration(seconds: 1));
                              _newkey.currentState!.validate();
                              String output =
                                  await authenticationMethod.signupUser(
                                      name: namecontroller.text,
                                      address: addresscontroller.text,
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text);

                              setState(() {
                                isLoading = false;
                              });
                              if (output == "success") {
                              } else {
                                Utils().showSnackBar(
                                    context: context, content: output);
                              }
                            },
                            child: const Text(
                                "                     Sign-Up                      ")),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomMainButton(
                    color: Colors.grey[600]!,
                    isLoading: false,
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return const SignInScreen();
                      }));
                    },
                    child: const Text(
                      "                      Back                   ",
                      style: TextStyle(
                        letterSpacing: 0.6,
                      ),
                    ))
              ]),
        ),
      ),
    );
  }
}
