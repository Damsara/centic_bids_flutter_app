import 'package:centic_bids/helper/app-enums.dart';
import 'package:centic_bids/helper/app-strings.dart';
import 'package:centic_bids/service-locator.dart';
import 'package:centic_bids/services/firebase-service.dart';
import 'package:centic_bids/services/nav-service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authServicesProvider = Provider<AuthenticationService>((ref) {
  return AuthenticationService(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User>((ref) {
  return ref.watch(authServicesProvider).authStateChanges;
});


final loginAsyncNotifier = StateNotifierProvider<LoginNotifier , AsyncValue<Validations>>((ref) => LoginNotifier(ref.read));

class LoginNotifier extends StateNotifier<AsyncValue<Validations>>{
  LoginNotifier(this.read) : super(AsyncData(Validations.NONE));

  final Reader read;

  void login(String email , String password) async{
    String output = await read(authServicesProvider).signIn(email: email , password: password);
    if (email == null || password == null || email.isEmpty || password.isEmpty){
      state = AsyncData(Validations.EMPTY);
      return;
    }
    if (output == 'Success'){
      locator<NavigationService>().pushReplacement(MAIN_SCREEN);
    }
    else {
      state = AsyncData(Validations.FAILED);
    }
  }
}



