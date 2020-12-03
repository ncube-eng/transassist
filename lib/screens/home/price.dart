import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pricing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(

      child: SingleChildScrollView(child:Column(

        children: <Widget>[
          Text('Trips are subject to 10% discount.'
              'Prices applicable for ages 4 and above',
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color:Colors.blueAccent,
            ),),

          Text('CURRENT TRAVEL FARES', style: GoogleFonts.darkerGrotesque(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color:Colors.black,
          ),),
          Text('Bulawayo R800', style: GoogleFonts.darkerGrotesque(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color:Colors.blueAccent,
          ),),
          Text('Gweru R850', style:GoogleFonts.darkerGrotesque(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color:Colors.blueAccent,
          ),),
          Text('Tsholotsho R850', style: GoogleFonts.darkerGrotesque(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color:Colors.blueAccent,
          ),),
          Text('Harare R950', style: GoogleFonts.darkerGrotesque(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color:Colors.blueAccent,
          ),),
          Text('Plumtree R850', style: GoogleFonts.darkerGrotesque(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color:Colors.blueAccent,
          ),),
          Text('Khezi R850', style: GoogleFonts.darkerGrotesque(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color:Colors.blueAccent,
          ),),
          Text('Mutare R950', style: GoogleFonts.darkerGrotesque(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color:Colors.blueAccent,
          )),
          Text('LOADING ADDRESS:Alexandra Filling Station'),
          Text('Cnr Roosevelt & 12th Ave '),
          Text('Alexandra,2014')
        ],
      ),
    )
    );

  }
}



