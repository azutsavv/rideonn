import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
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
                  margin: EdgeInsets.only(
                      top: 90, left: MediaQuery.of(context).size.width * 0.3),
                  child: Text(
                    'signup On \nRideOnn',
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
                                    .createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                  
                                ).then((value){
                                  
                                  Navigator.pushNamed(context, 'welcome');
                                
                                });
                                
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
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



// import 'dart:math';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';

// class signup extends StatefulWidget {
//   const signup({Key? key}) : super(key: key);
//   @override
//   State<signup> createState() => _signupState();
// }

// class _signupState extends State<signup> {
//   final _formkey = GlobalKey<FormState>();
//   String? name = '';
//   String? email = '';
//   String? passcode = '';

//   final namecontroller = TextEditingController();
//   final passcodecontroller = TextEditingController();
//   final emailcontroller = TextEditingController();

//   @override
//   void dispose() {
//     namecontroller.dispose();
//     emailcontroller.dispose();
//     passcodecontroller.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/login.jpeg'), fit: BoxFit.fill)),
//         child: Scaffold(
//           key: _formkey,
//           backgroundColor: Colors.transparent,
//           body: Stack(
//             children: [
//               Container(
//                   margin: EdgeInsets.only(top: 90, left: 90),
//                   child: Text(
//                     'signup to \n  RideOnn',
//                     style: GoogleFonts.acme(
//                       color: Colors.pink,
//                       fontSize: 45                   )
//                   )),
//               SingleChildScrollView(
//                 child: Container(
//                   margin: EdgeInsets.only(
//                       top: MediaQuery.of(context).size.height * 0.35,
//                       left: 30,
//                       right: 30),
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         onChanged: (value) => {name = value},
//                         decoration: InputDecoration(
//                             fillColor: Color.fromARGB(255, 212, 191, 191),
//                             filled: true,
//                             hintText: 'Enter Full name',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             )),
//                         controller: namecontroller,
//                         validator: (value) {
//                           if (name!.isEmpty || name == null) {
//                             return 'enter your name';
//                           } else if (name!.contains(' ')) {
//                             return 'provide space between first and last name';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       TextFormField(
//                         onChanged: (value) => {email = value},
//                         decoration: InputDecoration(
//                             fillColor: Color.fromARGB(255, 212, 191, 191),
//                             filled: true,
//                             hintText: 'email',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             )),
//                         controller: emailcontroller,
//                         validator: (value) {
//                           if (email!.isEmpty || passcode == null) {
//                             return 'enter your email';
//                           } else if (name!.contains('@')) {
//                             return 'enter valid mail';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       TextFormField(
//                         onChanged: (value) => {passcode = value},
//                         obscureText: true,
//                         decoration: InputDecoration(
//                             fillColor: Color.fromARGB(255, 212, 191, 191),
//                             filled: true,
//                             hintText: 'passcode',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             )),
//                         controller: passcodecontroller,
//                         validator: (value) {
//                           if (passcode!.isEmpty) {
//                             return 'enter your password';
//                           } else if (passcode!.length < 6) {
//                             return 'password must contain 6 character';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       // TextFormField(
//                       //   onTap: () async {
//                       //     final date = await showDatePicker(
//                       //         context: context,
//                       //         initialDate: DateTime.now(),
//                       //         firstDate: DateTime(1960),
//                       //         lastDate: DateTime.now());
//                       //     if (date != null) {
//                       //       setState(() {
//                       //        date = datecontroller.text;
//                       //       });
//                       //     }
//                       //   },
//                       //   decoration: InputDecoration(
//                       //       fillColor: Color.fromARGB(255, 212, 191, 191),
//                       //       filled: true,
//                       //       hintText: 'date of birth',
//                       //       border: OutlineInputBorder(
//                       //         borderRadius: BorderRadius.circular(12),
//                       //       )),
//                       // ),
//                       SizedBox(
//                         height: 50,
//                       ),
//                       ElevatedButton(
//                           style: ButtonStyle(
//                               textStyle: MaterialStateProperty.all(
//                                   TextStyle(fontSize: 20)),
//                               minimumSize:
//                                   MaterialStateProperty.all(Size(180, 45)),
//                               elevation: MaterialStateProperty.all(10),
//                               backgroundColor: MaterialStateProperty.all(
//                                   Color.fromARGB(2255, 190, 29, 96))),
//                           onPressed: () {
//                             if (_formkey.currentState!.validate()) {
//                               email = emailcontroller.text;
//                               passcode = passcodecontroller.text;
//                               name = namecontroller.text;
//                             }
//                           },
//                           child: Text('Sign Up')),
//                       SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
