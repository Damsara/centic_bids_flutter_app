

import 'package:firebase_auth/firebase_auth.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  Status _status = Status.Uninitialized;

  AuthenticationService(this._firebaseAuth);

  Status get status => _status;

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn ({String email , String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      _status = Status.Authenticated;
      return 'Success';
    }catch (e){
      _status = Status.Unauthenticated;
      return 'Error';
    }
  }

  Future<String> singUp (String email , String password) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return 'Created';
    } catch (e){
      return 'Failed';
    }
  }

}