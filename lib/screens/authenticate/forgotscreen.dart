import 'package:flutter/material.dart';
import 'package:transassist1/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transassist1/screens/authenticate/signin.dart';


class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
        appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation:0.0,
        title:Text('Forgot password'),automaticallyImplyLeading: false,),
      body:Center(
        child:Padding(
          padding:EdgeInsets.only(top:50,left:20,right:20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text('We will mail you a link..please click on the link to reset password',
                style: TextStyle(color: Colors.black),),
            SizedBox(height:20.0),
            TextFormField(
              decoration:textInputDecoration.copyWith(hintText: 'Email',icon:const Icon(Icons.email),),
              validator: (val)=>val.isEmpty ? 'Enter an email' : null,
              onChanged: (val){
                setState(() {
                  email=val;
                });
              },

            ),SizedBox(height:20.0),
                RaisedButton(
                  color:Colors.blueAccent,
                  child: Text(
                    'Send email',
                    style: TextStyle(color:Colors.white),

                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      FirebaseAuth.instance.sendPasswordResetEmail(email:email).then((val)=>print('Check email'));

                    }
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new Signin()));

                  }),
                ],
            ),

          ),
        ),
      ),
    );
  }
}

