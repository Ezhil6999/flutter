import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:amazon_demo/features/auth/widgets/button_widget.dart';
import 'package:amazon_demo/features/auth/widgets/textField_widget.dart';
import 'package:amazon_demo/features/auth/services/auth_services.dart';

enum Auth {
  signup,
  signin,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;

  final _signUpFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text);
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ListTile(
              title: const Text("Create Account"),
              leading: Radio(
                activeColor: Colors.black,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val) => {
                  setState(() => {_auth = val!})
                },
              ),
            ),
            if (_auth == Auth.signup)
              Form(
                key: _signUpFormKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                        context: 'Name',
                        controller: nameController,
                        obscuretext: false,
                      ),
                      TextFieldWidget(
                        context: 'E-mail',
                        controller: emailController,
                        obscuretext: false,
                      ),
                      TextFieldWidget(
                        context: 'Password',
                        controller: passwordController,
                        obscuretext: true,
                      ),
                      ButtonWidget(
                          onpressed: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                          child: 'Sign-up')
                    ]),
              ),
            ListTile(
              title: const Text(
                "Sign-In",
              ),
              leading: Radio(
                activeColor: Colors.black,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) => {
                  setState(() => {_auth = val!})
                },
              ),
            ),
            if (_auth == Auth.signin)
              Form(
                key: _signinFormKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                        context: 'E-mail',
                        controller: emailController,
                        obscuretext: false,
                      ),
                      TextFieldWidget(
                        context: 'Password',
                        controller: passwordController,
                        obscuretext: true,
                      ),
                      ButtonWidget(
                          onpressed: () {
                            if (_signinFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                          child: 'Sign-In')
                    ]),
              ),
          ],
        ),
      )),
    );
  }
}
