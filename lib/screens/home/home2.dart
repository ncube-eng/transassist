import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transassist1/constants/color_constant.dart';
import 'package:transassist1/constants/style.dart';
import 'package:transassist1/models/carousel_model.dart';
import 'package:transassist1/models/popular_destination_model.dart';
import 'package:transassist1/models/travlog_model.dart';
import 'package:transassist1/services/auth.dart';
import 'package:transassist1/screens/authenticate/booking.dart';
import 'package:transassist1/screens/home/welcome.dart';
import 'package:transassist1/screens/home/price.dart';
import 'package:transassist1/screens/wrapper.dart';






class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  final AuthService _auth = AuthService();

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }


  @override
  Widget build(BuildContext context) {
    void showPricingPanel(context){
      showModalBottomSheet(
          context:context,builder:(context){
        return Container(
          height:500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
          ),
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal:10.0),
          child:Pricing(),
        );
      }
      );

    };
    return Scaffold(
      backgroundColor: Colors.blue[50],

      // Setting up AppBar
     appBar:AppBar(
        backgroundColor: Colors.blue[400],
        title: Image.asset('assets/images/logo.png'),
        elevation: 0,
        actions:<Widget>[
          FlatButton.icon(
              icon: Icon(Icons.arrow_back),
              label:Text('Back'),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new HomePage())
                );}),
          FlatButton.icon(
            icon: Icon(Icons.payment),
            label: Text('Fares'),
            onPressed:(()=>showPricingPanel(context)),
          ),
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed:() async{
              print(_auth.user);
              await _auth.signOut();
              Wrapper();
            } ,
          ),
        ],automaticallyImplyLeading: false,
      ),


      // Body
      body: Center(child:Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // Promos Section
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 24),
              child: Text(
                'Call us on : 076 257 0164 / 062 319 9002  '
                    'Scroll down to book!!'
              ,
                style: TextStyle(color:Colors.red,fontSize: 18,fontFamily:'Times New Romans',),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(
                                  carousels[index].image,
                                ),
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: map<Widget>(
                          carousels,
                              (index, image) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              height: 6,
                              width: 6,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? mBlueColor
                                      : mGreyColor),
                            );
                          },
                        ),
                      ),

                      // More
                      Text(
                        'More...',
                        style: mMoreDiscountStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),         // Service Section



            // Popular Destination Section
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                'Popular Destinations!',
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 140,
              child: ListView.builder(
                itemCount: populars.length,
                padding: EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),child:Center(
                    child: Container(
                      height: 140,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mBorderColor, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              populars[index].image,
                              height: 74,
                            ),
                            Text(
                              populars[index].name,
                              style: mPopularDestinationTitleStyle,
                            ),
                            Text(
                              populars[index].country,
                              style: mPopularDestinationSubtitleStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  );
                },
              ),
            ),

            // Travlog Section

            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                'Blogs!',
                style: mTitleStyle,
              ),
            ),

            Container(
              height: 181,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16),
                itemCount: travlogs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 104,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(travlogs[index].image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                  'assets/svg/travlog_top_corner.svg'),

                            ),
                            Center(


                              child: SvgPicture.asset(
                                  'assets/svg/travelkuy_logo_white.svg'),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                  'assets/svg/travlog_bottom_gradient.svg'),
                            ),
                            Center(

                              child: Text(
                                'Travlog ' + travlogs[index].name,
                                style: mTravlogTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          travlogs[index].content,
                          maxLines: 3,
                          style: mTravlogContentStyle,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          travlogs[index].place,
                          style: mTravlogPlaceStyle,
                        )
                      ],
                    ),
                  );
                },
              ),
            ), Center(
                child:Align(
                    alignment: Alignment.bottomCenter,
                    child:RaisedButton(
                      onPressed:(){
                        Navigator.push(
                          context,MaterialPageRoute(
                            builder:(context)=>Booking()
                        ),
                        );
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: const Text(
                            'Book Now',
                            style: TextStyle(fontSize: 20)
                        ),
                      ),
                    )

                )

            ),
          ],
        ),
      )
      ),
    );
  }
}