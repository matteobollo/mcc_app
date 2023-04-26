import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  void logOut(){
    FirebaseAuth.instance.signOut();
  }
}
