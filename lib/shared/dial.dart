import 'package:flutter/material.dart';

class Dialogs{

  waiting(BuildContext context,String title,String description ){

    return showDialog(
    context:context,
    builder: (BuildContext context){
    return AlertDialog(
      title: Text(title),
      content:SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(description),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: ()=>Navigator.pop(context),
          child: Text('Ok'),
        ),
      ],
      );

  });
  }
}