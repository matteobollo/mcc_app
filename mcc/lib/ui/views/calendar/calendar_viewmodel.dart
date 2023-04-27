import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'calendar_view.dart';

class CalendarViewModel extends BaseViewModel{
  List<Color> _collectionColor = [];


  Future<List<Meeting>> getDatafromGoogleSheet() async{
    initializeColor();
    Response data = await get(Uri.parse("https://script.google.com/macros/s/AKfycbxCOGSEiYaKVHl1hSoQPryCj5NH7xYVEUVY-FxOaIpX7T-CaTR1bPi_9ZsNMTG1rOBV/exec"));
    dynamic jsonAppData = jsonDecode(data.body);
    List<Meeting> appointmentData = [];
    Random random = new Random();
    for(dynamic data in jsonAppData){
      Meeting meetingData = Meeting(
        eventName: data['subject'],
        from: stringToDateTime(data['starttime']),
        to: stringToDateTime(data['endtime']),
        background: _collectionColor[random.nextInt(8)],
      );
      appointmentData.add(meetingData);
    }
    return appointmentData;
  }

  DateTime stringToDateTime(String string) {
    DateFormat format = DateFormat("dd/MM/yyyy HH:mm");
    return format.parse(string);
  }

  void initializeColor(){
    _collectionColor.add(Colors.redAccent);
    _collectionColor.add(Colors.lightGreenAccent);
    _collectionColor.add(Colors.greenAccent);
    _collectionColor.add(Colors.purpleAccent);
    _collectionColor.add(Colors.blueAccent);
    _collectionColor.add(Colors.pinkAccent);
    _collectionColor.add(Colors.indigoAccent);
    _collectionColor.add(Colors.tealAccent);
  }
}




