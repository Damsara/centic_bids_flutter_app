import 'package:centic_bids/helper/app-enums.dart';
import 'package:centic_bids/helper/app-strings.dart';
import 'package:centic_bids/service-locator.dart';
import 'file:///D:/NewApps/centic_bids/lib/services/firebase/auth-service.dart';
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
    if (email == null || password == null || email.isEmpty || password.isEmpty){
      state = AsyncData(Validations.EMPTY);
      return;
    }
    String output = await read(authServicesProvider).signIn(email: email , password: password);
    if (output == 'Success'){
      locator<NavigationService>().pushReplacement(MAIN_SCREEN);
    }
    else {
      state = AsyncData(Validations.FAILED);
    }
  }

  void register(String email , String password , String confirmpassword) async{
    if (email == null || password == null || email.isEmpty || password.isEmpty){
      state = AsyncData(Validations.EMPTY);
      return;
    }
    if(password != confirmpassword){
      state = AsyncData(Validations.SAME);
      return;
    }
    String output = await locator<AuthenticationService>().singUp(email, password);
    if (output == "Created"){
      locator<NavigationService>().pushReplacement(MAIN_SCREEN);
    }else{
      state = AsyncData(Validations.FAILED);
    }
  }
}



