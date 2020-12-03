import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transassist1/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transassist1/screens/authenticate/signin.dart';
import 'package:transassist1/services/database.dart';
import 'package:transassist1/models/user.dart';
import 'package:transassist1/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transassist1/shared/loading.dart';
import 'package:transassist1/screens/home/home2.dart';
import 'package:transassist1/shared/dial.dart';


var uid;

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String _name;
  String _surname;
  String _phoneNumber;
  String _passengers;
  String _disability;
  String _destination;
  String _day;
  String _pickup;
  String _destinationAddress;
  String _nextOfKin;
  String _nextOfKinContacts;
  String _pickupAddress;
  bool _good;
  bool loading = false;
 Dialogs dialogs =new Dialogs();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName(){

    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value){
        if(value.isEmpty){
          return 'Name is required';
          }
          return null;
      },
      onSaved:(String value ){_name = value;} ,
    );
  }

  Widget _buildgood(){

    return TextFormField(
      decoration: InputDecoration(labelText: 'Do you have any goods (yes/no)'),
      validator: (String value){
        if(value.isEmpty){
          return 'Required';
        }
        return null;
      },
      onSaved:(String value ){_name = value;} ,
    );
  }

  Widget _buildpickupAddress(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Pick up address'),
      validator: (String value){
        if(value.isEmpty){
          return 'Address is required';
        }
        return null;
      },
      onSaved:(String value ){_pickupAddress = value;} ,
    );
  }

  Widget _buildsurname(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Surname'),
      validator: (String value){
        if(value.isEmpty){
          return 'Surname is required';
        }
        return null;
      },
      onSaved:(String value ){_surname = value;} ,
    );
  }
  Widget _buildphoneNumber(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number(start with +27'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is required';
        }

    return null;
        },
        onSaved:(String value ){_phoneNumber = value;},

      );

  }

  Widget _buildpassengers(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Number of passengers'),
      validator: (String value){
        int passengers = int.tryParse(value);
        if(passengers == null || passengers <= 0){
          return 'passengers are required and must be greater than zero';
        }
        return null;
      },
      onSaved:(String value ){_passengers = value;} ,
    );
  }
  Widget _builddisability(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Any disabled person( type yes or no'),
      validator: (String value){
        if(value.isEmpty){
          return 'Required';
        }
        return null;
      },
      onSaved:(String value ){_disability = value;} ,
    );
  }
  Widget _builddestination(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Destination'),
      validator: (String value){
        if(value.isEmpty){
          return 'Required';
        }
        return null;
      },
      onSaved:(String value ){_destination = value;} ,
    );
  }
  Widget _buildday(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Date and Month of departure'),
      validator: (String value){
        if(value.isEmpty){
          return 'Required';
        }
        return null;

      },
      onSaved:(String value ){_day = value;} ,
    );
  }
  Widget _buildpickup(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Do you need us to pick you up(yes or no)'),
      validator: (String value){
        if(value.isEmpty){
          return 'Required';
        }
        return null;
      },
      onSaved:(String value ){_pickup = value;} ,
    );
  }
  Widget _builddestinationAddress(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Enter full destination address'),
      validator: (String value){
        if(value.isEmpty){
          return 'Required';
        }
        return null;
      },
      onSaved:(String value ){_destinationAddress = value;} ,
    );
  }

  Widget  _buildnextOfKin(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Enter name and surname of next of kin'),
      validator: (String value){
        if(value.isEmpty){
          return 'Required';
        }
        return null;
      },
      onSaved:(String value ){_nextOfKin = value;} ,
    );
  }

  Widget _buildnextOfKinContacts(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Enter next of kin contact details'),
      validator: (String value){
        if(value.isEmpty){
          return 'Required';
        }
        return null;
      },
      onSaved:(String value ){_nextOfKinContacts = value;} ,
    );
  }


  @override
  Widget build(BuildContext context) {
      return loading ? Loading() :Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(title:Text('Book Now')),
      body: SingleChildScrollView(child:Container(
        margin:EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildName(),
            _buildsurname(),
            _buildphoneNumber(),
            _buildpassengers(),
            _builddisability(),
            _builddestination(),
            _buildday(),
            _buildpickup(),
            _builddestinationAddress(),
             _buildnextOfKin(),
            _buildnextOfKinContacts(),
            _buildpickupAddress(),
            Text('Deposit of R250 should be made 2 days prior departure day.Non-Refundable',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),),
            Text('Bring cash to premises or deposit in this account.',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18)),
              Text('Acc:62877217218 ',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18)),
               Text('Acc Holder:Transport Assist Group '
                'FNB',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18)),
            SizedBox(
              height: 100),
              RaisedButton(
                color: Colors.blue,
                child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 16),),
                onPressed: () async {

                  final User user = await FirebaseAuth.instance.currentUser;
                  final userid = user.uid;
                  if (!_formKey.currentState.validate()) {
                      return;
                  }
                  setState(()=>loading = true);
                   _formKey.currentState.save();
                  FirebaseFirestore.instance.collection('travel').document('$userid').set({
                    'name':_name,'surname':_surname,'phone number':_phoneNumber,
                  'passengers':_passengers,'disability':_disability,'destination':_destination,'day of departure':_day,
                    'pick up':_pickup,'Do you have any goods or parcels':_good,'next of kin':_nextOfKin,'next of kin contacts':_nextOfKinContacts,'Destination Address':_destinationAddress,'pick up address':_pickupAddress
                  });
                   loading = false;
                   dialogs.waiting(context, 'Database', 'Booking succesful.You will get a call soon.');
                    await Future.delayed(Duration(seconds:4));
                    Navigator.pop(context);
                   _formKey.currentState.reset();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));


                  print(userid);
                })

          ],
        ),),
      ),
    )
    );
  }
}
