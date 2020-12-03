import 'package:flutter/material.dart';
import 'package:transassist1/services/auth.dart';
import 'package:transassist1/shared/constants.dart';
import 'package:transassist1/shared/loading.dart';
import 'package:transassist1/screens/home/welcome.dart';




class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //Text field state

  String email = '';
  String password ='';
  String name ='';
  String phone='';
  String error ='';
  bool loading = false;
  bool _obscureText = true;
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
              label: Text('Sign in'),
              onPressed: (){
                widget.toggleView();
              },
            )
          ],automaticallyImplyLeading: false,
      ),
      body:SingleChildScrollView(child:Container(
          padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 50.0 ),
          child:Center(
          child: Form(
            key:_formKey,
              child:Column(
                  children:<Widget>[
                    SizedBox(height:20.0),
                    SizedBox(height:20.0),
                    TextFormField(
                      decoration:textInputDecoration.copyWith(icon:const Icon(Icons.email),hintText: 'Email'),
                      validator: (val)=>val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val){
                        setState(() {
                          email=val;
                        });
                      },

                    ),
                    SizedBox(height:20.0),
                    TextFormField(
                      decoration:textInputDecoration.copyWith(icon:const Icon(Icons.security),hintText: 'Password',suffixIcon: IconButton(
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
                    ),
                    SizedBox(height:20.0),
                    RaisedButton(
                      color:Colors.blueAccent,
                      child: Text(
                        'Register',
                        style: TextStyle(color:Colors.white),

                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error =
                              ('Please supply a valid email or password');
                              loading = false;
                            }
                            );
                          }
                        }
                      }

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
      ),
    );
  }
}


