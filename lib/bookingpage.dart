

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideonn/bikelist.dart';
import 'package:rideonn/bookingpage.dart';
import 'package:rideonn/classbike.dart';
import 'package:rideonn/main.dart';

class booking extends StatefulWidget {
  final Bike bike;
  final int index;
  booking({Key? key, required this.bike, required this.index})
      : super(key: key);

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  var days = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white54),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(widget.bike.image),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: [Colors.blueGrey, Colors.teal.shade50],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.center),
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(3),
                        child: Text(widget.bike.name,
                            style:
                                GoogleFonts.acme(fontSize: 30, color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('price(per/day) :',
                              style: GoogleFonts.acme(
                                  fontSize: 25, color: Colors.black)),
                          Text((widget.bike.rental).toString(),
                              style: GoogleFonts.acme(
                                  fontSize: 25, color: Colors.black))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text('DAYS',
                          style:
                              GoogleFonts.acme(fontSize: 30, color: Colors.black)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.blueGrey, Colors.grey],
                                  begin: FractionalOffset.bottomCenter,
                                  end: FractionalOffset.center),
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (days > 1) {
                                  setState(() {
                                    days--;
                                  });
                                }
                              },
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: Icon(FontAwesomeIcons.minus),
                            ),
                          ),
                        ),
                        Container(
                            height: 30,
                            width: 100,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.shade800,
                            ),
                            child: Text(
                              days.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            )),
                        Material(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.blueGrey, Colors.grey],
                                  begin: FractionalOffset.bottomCenter,
                                  end: FractionalOffset.center),
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (days < 5) {
                                  setState(() {
                                    days++;
                                  });
                                }
                              },
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: Icon(
                                FontAwesomeIcons.plus,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),


                  
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Text('Final Price  : ',
                      style: GoogleFonts.acme(fontSize: 25, color: Colors.black) ,),
                      Text((widget.bike.rental*days).toString(),
                      style:  GoogleFonts.acme(fontSize: 25, color: Colors.black),) 
                      ],

                    ),
                  ),
                  SizedBox(height: 20,),
                    SizedBox(
                      height: 40,
                      width: 280,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'final');
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(20),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey.shade800)),
                          child: Text('Book Now', style: TextStyle(fontSize: 26))),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
