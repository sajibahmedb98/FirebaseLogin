import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/auth/auth_service.dart';
import 'package:login_app/components/button.dart';
import 'package:login_app/components/textfield.dart';
import 'package:login_app/pages/register_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  //text eiditing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  //signin user with email and password
  void signinUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // try sign in user
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
      popLoadinCircle();
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      popLoadinCircle();

      //show error message
      showErrorMessage(e.code);

    }
  }

  //pop circle loading dialog
  void popLoadinCircle() {
    Navigator.pop(context);
  }

  //show error message to the user
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.blue.shade300,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //welcome text :welcome back
          
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Welcome back',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Welcome back! Please enter your details',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
          
                //email textfield
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    UserTextField(
                      textEditingController: usernameController,
                      hintText: 'Enter your email',
                      obscuredtext: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
          
                    //password textfield
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    UserTextField(
                      textEditingController: passwordController,
                      hintText: 'Enter your password',
                      obscuredtext: true,
                    ),
          
                    //forgot password text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
          
                    //sign in button
                    GestureDetector(
                      onTap: () {
                        signinUser();
                      },
                      child: const UserButton(
                          buttonTextColor: Colors.white,
                          buttonName: 'Sign in',
                          buttonColor: Colors.blue),
                    ),
          
                    //sign in button with google icon
                    GestureDetector(
                      onTap: () {
                        AuthService().signInWithGoogle();
                      },
                      child: const UserButton(
                          buttonIcon: Icon(
                            EvaIcons.googleOutline,
                          ),
                          buttonTextColor: Colors.black,
                          buttonName: 'Sign in with google',
                          buttonColor: Colors.white),
                    ),
          
                    //dont have an account?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Dont have an account? ',
                            style: TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.w600),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              )),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
          
                //forgot password text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
