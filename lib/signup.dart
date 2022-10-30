import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formkey = GlobalKey<FormState>();
  var name = "";
  var email = "";
  var password = "";

  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    namecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login.jpeg'), fit: BoxFit.fill)),
        child: Scaffold(
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
                    key: _formkey,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 212, 191, 191),
                            filled: true,
                            hintText: 'Enter Full name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        controller: namecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter name';
                          } else if (!value.contains(' ')) {
                            return 'give space between first and last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 212, 191, 191),
                            filled: true,
                            hintText: 'email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        controller: emailcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter email';
                          } else if (!value.contains('@')) {
                            return 'enter valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 8,
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
                        controller: passwordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter password';
                          }
                          return null;
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
                              setState(() {
                                email = emailcontroller.text;
                                password = passwordcontroller.text;
                                name = namecontroller.text;
                              });
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
