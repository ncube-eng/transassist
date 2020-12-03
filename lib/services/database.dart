import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{
  //collection Reference
  var now = new DateTime.now();
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference Travel = Firestore.instance.collection('travel');

  Future updateUserData(String now,String name, String surname, String passengers,String Destination ) async{
    return await Travel.document(uid).setData({
      'date of booking':now,
      'name':name,
      'surname':surname,
      'passengers':passengers,
      'Destination':Destination,
    });
  }

}