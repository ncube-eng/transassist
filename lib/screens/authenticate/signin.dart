import 'package:flutter/material.dart';
import 'package:transassist1/services/auth.dart';
import 'package:transassist1/shared/constants.dart';
import 'package:transassist1/shared/loading.dart';
import 'package:transassist1/screens/home/welcome.dart';
import 'package:transassist1/models/colors.dart';
import 'package:transassist1/screens/authenticate/forgotscreen.dart';



class Signin extends StatefulWidget {
  final Function toggleView;
  Signin({this.toggleView});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool _obscureText=true;

  //Text field state

  String email = '';
  String password ='';
  String error ='';
  
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation:0.0,
        actions:<Widget>[
          FlatButton.icon(
              icon: Icon(Icons.arrow_back),
              label: Text('Back'),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new HomePage())
                );}),
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],automaticallyImplyLeading: false,
      ),
      body:SingleChildScrollView(child:Container(
        padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 50.0 ),
        child: Form(
          key:_formKey,
          child:Center(
          child:Column(
            children:<Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration:textInputDecoration.copyWith(hintText: 'Email',icon:const Icon(Icons.email),),
                validator: (val)=>val.isEmpty ? 'Enter an email' : null,
                onChanged: (val){
                  setState(() {
                    email=val;
                  });
                },

                              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration:textInputDecoration.copyWith(hintText: 'Password',icon:const Icon(Icons.security),suffixIcon: IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: (){ setState((){
                  _obscureText = !_obscureText;
                });},

              )),
                obscureText: _obscureText,
                validator: (val)=>val.length < 6 ? 'Enter a password 6+ characters long' : null,
                onChanged: (val){
                 setState(() {
                   password = val;
                 });
                },
              )
              ,Container(
          width: double.infinity,
          child:InkWell(
              onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (BuildContext context) =>ForgotScreen()
        ));
        },
          child:Text('Forgot Password?',
              style:TextStyle(color:Colors.redAccent),textAlign:
              TextAlign.right),
        ),

      ),


              SizedBox(height:20.0),
              RaisedButton(
                color:Colors.blueAccent,
                child: Text(
                  'Sign in',
                  style: TextStyle(color:Colors.white),

                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()){
                    setState(()=>loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error= ('Could not sign in with those credentials.Please Register first');
                        loading = false;
                      }
                      );
                    }
                  }
                },
              ),
            SizedBox(height: 12.0,),
            Text(
                error,style: TextStyle(
                color: Colors.red,fontSize: 14.0
            ),
            )

            ]
          )
        )
      ),
      ),
      )
    );
  }
}
