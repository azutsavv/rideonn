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
    return Container(
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

          Text('Booking has been confirmed. \nYou will recieive am email shortly.',
          style: GoogleFonts.besley(
            fontSize: 20,
            color: Colors.black

          ) 
          ),
        ],

      )
    );
  }
}