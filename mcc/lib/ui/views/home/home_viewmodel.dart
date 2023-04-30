import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import '../login/loginscreen_viewmodel.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends BaseViewModel {
  String text = '';
  Future<void> logOut() async{
    await FirebaseAuth.instance.signOut();
    await googleSI.signOut();
  }

  String? getNome() {
    String? nome = googleSI.currentUser?.displayName;
    int? spaceIndex = nome?.indexOf(' '); // Ottiene l'indice dello spazio
    if (spaceIndex == -1) {
      return nome; // Se non c'è spazio, restituisce la stringa originale
    } else {
      return nome?.substring(0, spaceIndex); // Restituisce la sottostringa fino allo spazio
    }
  }

  getText(){
    String? nome = getNome();
    DateTime now = DateTime.now();
    if (nome == null) {
      if(now.hour > 12 && now.hour <= 16){
        text = 'Buon Pomeriggio!';
      } else if(now.hour > 16 && now.hour <= 21){
        text = 'Buonasera!';
      } else if(now.hour > 21 && now.hour <= 5){
        text = 'Buona Notte!';
      } else if(now.hour > 5 && now.hour  <= 12){
        text = 'Buongiorno!';
      }
    } else{
      if(now.hour > 12 && now.hour <= 16){
        text = 'Buon Pomeriggio ${nome}!';
      } else if(now.hour > 16 && now.hour <= 21){
        text = 'Buonasera ${nome}!';
      } else if(now.hour > 21 && now.hour <= 5){
        text = 'Buona Notte ${nome}!';
      } else if(now.hour > 5 && now.hour  <= 12){
        text = 'Buongiorno ${nome}!';
      }
    }
    return text;
  }

  Future<List<Status>> getDatafromGoogleSheet() async{
    Response data = await get(Uri.parse("https://script.google.com/macros/s/AKfycbwQduQdgO3mRpp4A5Yg3PG60mrPS2tQ_9ROJo5OQ935BOWcBXuZpI9Bch2dICV-6yRM/exec"));
    dynamic jsonAppData = jsonDecode(data.body);
    List<Status> statusIscrizioni = [];
    for(dynamic data in jsonAppData){
       Status status = Status(
           isOpen: data['open']
       );
       statusIscrizioni.add(status);
    }
    return statusIscrizioni;
  }
}

class Status{
  Status({
    required this.isOpen,
  });

  String? isOpen;
}
