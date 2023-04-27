import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import '../login/loginscreen_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  String text = '';
  Future<void> logOut() async{
    await FirebaseAuth.instance.signOut();
    await googleSI.signOut();
  }

  getText(){
    DateTime now = DateTime.now();
    if(now.hour > 12 && now.hour <= 16){
      text = 'Buon Pomeriggio!';
    } else if(now.hour > 16 && now.hour <= 21){
      text = 'Buonasera!';
    } else if(now.hour > 21 && now.hour <= 5){
      text = 'Buona Notte!';
    } else if(now.hour > 5 && now.hour  <= 12){
      text = 'Buongiorno!';
    }
    return text;
  }
}
