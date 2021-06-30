

import 'package:centic_bids/services/firebase/auth-service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth{}
class MockFirebaseUser extends Mock implements User{}
class MockAuthResult extends Mock implements UserCredential {}

void main(){

  MockFirebaseAuth _auth = MockFirebaseAuth();
  BehaviorSubject<MockFirebaseUser> _user = BehaviorSubject<MockFirebaseUser>();

  when(_auth.authStateChanges()).thenAnswer((_){
    return _user;
  });

  AuthenticationService _repo = AuthenticationService(_auth);

  group('user repo testing', (){

    when(_auth.signInWithEmailAndPassword(email: "hdtdamsara@gmail.com",password: "chinthacalling")).thenAnswer((_)async{
      _user.add(MockFirebaseUser());
      return MockAuthResult();
    });

    test("sign in with email and password", () async {
      String signedIn = await _repo.signIn(email: "hdtdamsara@gmail.com" , password: 'chinthacalling');
      expect(signedIn, 'Success');
      expect(_repo.status, Status.Authenticated);
    });

    test("sign up with email and password", () async {
      String signedIn = await _repo.signUp('damasuperera@gmail.com' , '123456');
      expect(signedIn, 'Created');
    });


  });


}