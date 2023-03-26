import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:login_app/auth/auth_service.dart';
import 'package:login_app/components/button.dart';
import 'package:login_app/components/textfield.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //welcome text :welcome back
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
                  const UserTextField(
                    hintText: 'Enter your email',
                    obscuredtext: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //password textfield
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const UserTextField(
                    hintText: 'Enter your password',
                    obscuredtext: true,
                  ),

                  //forgot password text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forget Password',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  //sign in button
                  const UserButton(
                      buttonTextColor: Colors.white,
                      buttonName: 'Sign in',
                      buttonColor: Colors.blue),

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
                ],
              )

              //forgot password text
            ],
          ),
        ),
      ),
    );
  }
}
