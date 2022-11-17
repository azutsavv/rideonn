import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class booked extends StatelessWidget {
  const booked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          
    
        ),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Icon(FontAwesomeIcons.circleCheck,
            size: 100,
            color: Colors.green.shade600,),
            SizedBox(height: 20,),
    
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Booking has been confirmed. \nYou will recieive an email shortly.',
              style: GoogleFonts.besley(
                fontSize: 20,
                color: Colors.black
    
              ) 
              ),
            ),
          ],
    
        )
      ),
    );
  }
}