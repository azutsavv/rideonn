import 'dart:math';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formkey = GlobalKey<FormState>();
  String name = '', email = '', passcode = '';

  final namecontroller = TextEditingController();
  final passcodecontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passcodecontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login.jpeg'), fit: BoxFit.fill)),
        child: Scaffold(
          key: _formkey,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 90, left: 90),
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
                      top: MediaQuery.of(context).size.height * 0.35,
                      left: 30,
                      right: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) => {name = value},
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 212, 191, 191),
                            filled: true,
                            hintText: 'Enter Full name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        controller: namecontroller,
                        validator: (value) {
                          if (!name.isEmpty || name == null) {
                            return 'enter your name';
                          } else if (!name.contains(' ')) {
                            return 'provide space between first and last name';
                          }
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        onChanged: (value) => {email = value},
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 212, 191, 191),
                            filled: true,
                            hintText: 'email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        controller: emailcontroller,
                        validator: (value) {
                          if (!email.isEmpty || passcode == null) {
                            return 'enter your email';
                          } else if (!name.contains('@')) {
                            return 'enter valid mail';
                          }
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        onChanged: (value) => {passcode = value},
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 212, 191, 191),
                            filled: true,
                            hintText: 'passcode',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        controller: passcodecontroller,
                        validator: (value) {
                          if (!passcode.isEmpty) {
                            return 'enter your password';
                          } else if (passcode.length < 6) {
                            return 'password must contain 6 character';
                          }
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      // TextFormField(
                      //   onTap: () async {
                      //     final date = await showDatePicker(
                      //         context: context,
                      //         initialDate: DateTime.now(),
                      //         firstDate: DateTime(1960),
                      //         lastDate: DateTime.now());
                      //     if (date != null) {
                      //       setState(() {
                      //        date = datecontroller.text;
                      //       });
                      //     }
                      //   },
                      //   decoration: InputDecoration(
                      //       fillColor: Color.fromARGB(255, 212, 191, 191),
                      //       filled: true,
                      //       hintText: 'date of birth',
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(12),
                      //       )),
                      // ),
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
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              email = emailcontroller.text;
                              passcode = passcodecontroller.text;
                              name = namecontroller.text;
                            }
                          },
                          child: Text('Sign Up')),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
