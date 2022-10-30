import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class forgotpasscode extends StatefulWidget {
  forgotpasscode({Key? key}) : super(key: key);

  @override
  State<forgotpasscode> createState() => _forgotpasscodedState();
}

class _forgotpasscodedState extends State<forgotpasscode> {
  final _formkey = GlobalKey<FormState>();

  var email = "";
  

  final emailController = TextEditingController();
  

  @override
  void dispose() {
    emailController.dispose();
    
    super.dispose();
  }

  @override
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
                  SizedBox(height: 10,),
                  Container(
                    
                     margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.34, left: 90),
                     child: Text('forgot passcode \na link will be sent to you ',
                     style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                     ),
                     ),

                  ),
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
                                  email = emailController.text;
                                  
                                });
                              }
                            },
                            child: Text('Send')),
                        
                        
                        
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
