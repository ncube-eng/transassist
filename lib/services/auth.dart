import 'package:firebase_auth/firebase_auth.dart';
import 'package:transassist1/models/user.dart';
import 'package:transassist1/services/database.dart';
import 'package:transassist1/screens/home/welcome.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create user obj based on firebase

  Userp _userFromFirebaseUser(User user) {
    return user != null ? Userp(uid: user.uid) : null;
  }

  //auth change user stream

  Stream<Userp> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in email and password
  Future signInWithEmailAndPassword(String email,String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email:email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //register with email and password
Future registerWithEmailAndPassword(String email,String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email:email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid).updateUserData('just signed in not booked','','','','');
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
}

  //sign out
  Future signOut() async {
    try {
      return {
        await _auth.signOut(),
        HomePage(),
      };

    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
}