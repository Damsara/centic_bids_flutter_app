

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Future<String> signIn ({String email , String password}){

  }

  Future<String> singUp (String email , String password){
    
  }

}