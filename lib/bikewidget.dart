import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rideonn/bikelist.dart';
import 'package:rideonn/classbike.dart';

class bikecard extends StatelessWidget {
  final Bike bike;
  final int index;

 const bikecard({Key? key, required this.bike, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.48,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  
                  gradient: LinearGradient(
                    colors: [
                        Colors.blueGrey,
                        Colors.grey
                        

                    ],
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.center
                  ),
                    color: Colors.pink[800],
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      
                      padding:  EdgeInsets.all(5.0),
                      child: Text(bike.name,
                  style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 7, 5, 5),
                      fontWeight: FontWeight.bold
                  ),
                  ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        
                        Padding(padding: EdgeInsets.all(3)),
                        Text('Top Speed  :  ',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                        ),),
                        
                        Text( bike.topSpeed.toString(),
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          
                        ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        
                        Padding(padding: EdgeInsets.all(3)),
                        Text('Mileage  :  ',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                        ),),
                        
                        Text( bike.mileage.toString(),
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          
                        ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        
                        Padding(padding: EdgeInsets.all(3)),
                        Text('Engine  :  ',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                        ),),
                        
                        Text( bike.engine.toString(),
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          
                        ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        
                        Padding(padding: EdgeInsets.all(3)),
                        Text('Price  :  ',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                        ),),
                        
                        Text( bike.rental.toString(),
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          
                        ),)
                      ],
                    ),
                  ),

                  
                  
                   
                    
                    ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 40,
              child: Container(
                width: MediaQuery.of(context).size.width*0.5,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[900]
                  
                ),
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, 'dfsgdf'),
                  child:  Text('Book Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                      
                    ),
                    
                    
                    ),
                  
                ),
              ),
            ),
            Image.asset(bike.image)
          ],
        ),
      ),
    );
  }
}
