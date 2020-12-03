import 'package:flutter/material.dart';
import 'package:transassist1/screens/wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:transassist1/services/auth.dart';
import 'package:transassist1/models/user.dart';
import 'package:transassist1/screens/home/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userp>.value(
      value: AuthService().user,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    ),
    );
  }
}
