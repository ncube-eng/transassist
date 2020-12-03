import 'package:flutter/material.dart';
import 'package:transassist1/constants/color_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';




class BottomNavigationTravelKuy extends StatefulWidget{
  @override
  _BottomNavigationTravelKuyState createState()=>  _BottomNavigationTravelKuyState();
}
class _BottomNavigationTravelKuyState extends State<BottomNavigationTravelKuy> {
  var _selectedIndex =0;

  var bottomTextStyle = GoogleFonts.inter(
    fontSize:12,fontWeight:FontWeight.w500
  );

  void _onItemTapped(int index){
    setState((){
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color:mFillColor,
        boxShadow:[
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0,5),
          ),

        ]
    ,
     borderRadius: BorderRadius.only(
       topLeft: Radius.circular(24),
       topRight: Radius.circular(24),
     ),
      ),
      child: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon:_selectedIndex == 0 ?
         new SvgPicture.asset('assets/icons/home.svg')
          :new SvgPicture.asset('assets/icons/home_color.svg') ,
          title:Text('My Account',style: bottomTextStyle,
          ),
        ),

    BottomNavigationBarItem(icon:_selectedIndex == 1 ?
    new SvgPicture.asset('assets/icons/home.svg')
        :new SvgPicture.asset('assets/icons/home_color.svg') ,
    title:Text('Booking',style: bottomTextStyle,
    ),
    ),

        BottomNavigationBarItem(icon:_selectedIndex == 2 ?
    new SvgPicture.asset('assets/icons/home.svg')
        :new SvgPicture.asset('assets/icons/home_colored.svg') ,
    title:Text('Prcib',style: bottomTextStyle,
    ),
    ),


    ],
      currentIndex: _selectedIndex,
        selectedItemColor: mBlueColor,
        unselectedItemColor: mSubtitleColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: true,
        elevation: 0,
      ),
    );
  }
}
