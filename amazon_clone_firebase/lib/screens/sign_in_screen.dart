import 'package:amazon_clone_firebase/screens/sign_up_screen.dart';
import 'package:amazon_clone_firebase/utils/color_themes.dart';
import 'package:amazon_clone_firebase/widget/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone_firebase/utils/constants.dart';
import 'package:amazon_clone_firebase/utils/utils.dart';
import 'package:amazon_clone_firebase/resourse/authentication_method.dart';
import 'package:amazon_clone_firebase/widget/text_field_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _newkey = GlobalKey<FormState>();
  AuthenticationMethod authenticationMethod = AuthenticationMethod();
  bool isLoading = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
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
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: Form(
                    key: _newkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Sign-In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black87),
                        ),
                        textEditingWidgets(
                            title: 'E-mail',
                            controllers: emailcontroller,
                            obscureTest: false),
                        textEditingWidgets(
                            title: 'Password',
                            controllers: passwordcontroller,
                            obscureTest: true),
                        CustomMainButton(
                            color: Colors.black87,
                            isLoading: isLoading,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              Future.delayed(Duration(seconds: 1));
                              _newkey.currentState!.validate();
                              String output =
                                  await authenticationMethod.signinUser(
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
                                "                     Sign-In                      ")),
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
                        return const SignUpScreen();
                      }));
                    },
                    child: const Text(
                      "  Create an Amazon Account  ",
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
