import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import '../login/loginscreen_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  Future<void> logOut() async{
    await FirebaseAuth.instance.signOut();
    await googleSI.signOut();
  }
}
