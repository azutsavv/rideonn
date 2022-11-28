import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class welcome extends StatefulWidget {
  welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  final _formkey = GlobalKey<FormState>();

  var email = "";
  var password = "";

  final emailController = TextEditingController();
  final passcodeController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
                    colors: [
                        Colors.blueGrey,
                        Colors.grey
                        

                    ],
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.center
                  ),
                  ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 90, left: MediaQuery.of(context).size.width * 0.3),
                  child: Text(
                    'Welcome to \n  RideOnn',
                    style: TextStyle(
                        color: Color.fromARGB(255, 190, 29, 96),
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.4,
                      left: 30,
                      right: 30),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                            decoration: InputDecoration(
                                fillColor: Color.fromARGB(255, 212, 191, 191),
                                filled: true,
                                hintText: 'email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter email';
                              } else if (!value.contains('@')) {
                                return 'enter valid email';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Color.fromARGB(255, 212, 191, 191),
                                filled: true,
                                hintText: 'passcode',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                            controller: passcodeController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter password';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 20)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(180, 45)),
                                elevation: MaterialStateProperty.all(10),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(2255, 190, 29, 96))),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  email = emailController.text;
                                  password = passcodeController.text;
                                });
                              }
                              try {
                                final credential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: email, password: password).then((value) {
                                          Navigator.pushNamed(context, 'login');
                                        })
                                        ;
                                
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  print(
                                      'Wrong password provided for that user.');
                                }
                              }
                            },
                            child: Text('Sign in')),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, 'forgotpasscode'),
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                    color: Color.fromARGB(2255, 190, 29, 96),
                                  ),
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'signup');
                                },
                                child: Text(
                                  'New User  ?',
                                  style: TextStyle(
                                    color: Color.fromARGB(2255, 190, 29, 96),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
