import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideonn/bikelist.dart';
import 'package:rideonn/bikewidget.dart';
import 'package:rideonn/classbike.dart';

class homepage extends StatelessWidget {
 
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1, left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                
                child: Text(
                  'Choose your Bike',
                  style: TextStyle(
                    color: Color.fromARGB(255, 190, 29, 96),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: BikeList.bike.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      Expanded(child: bikecard(bike: BikeList.bike[index], index: index) ),
                ),
              )
            ],
          ),
        ));
  }
}
