import 'package:flutter/material.dart';
import 'package:transassist1/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:transassist1/models/user.dart';
import 'package:transassist1/screens/home/home2.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate
   final user = Provider.of<Userp>(context);

   if (user == null){
     return Authenticate();
   }
   else {
     return HomeScreen();
   }

  }
}
