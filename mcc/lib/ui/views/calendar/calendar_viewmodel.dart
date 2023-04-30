import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../../component/meeting.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class CalendarViewModel extends BaseViewModel{
  CalendarView view = CalendarView.month;
  CalendarView get getView => view;

  void setView(int num){
    if(num == 1){
      view = CalendarView.month;
    } else if(num == 2){
      view = CalendarView.week;
    }
    rebuildUi();
  }

  Future<List<Meeting>> getDatafromGoogleSheet() async{
    Response data = await get(Uri.parse("https://script.google.com/macros/s/AKfycbxCOGSEiYaKVHl1hSoQPryCj5NH7xYVEUVY-FxOaIpX7T-CaTR1bPi_9ZsNMTG1rOBV/exec"));
    dynamic jsonAppData = jsonDecode(data.body);
    List<Meeting> appointmentData = [];
    Random random = new Random();
    for(dynamic data in jsonAppData){
      Meeting meetingData = Meeting(
        eventName: data['subject'],
        from: stringToDateTime(data['starttime']),
        to: stringToDateTime(data['endtime']),
        background: initializeColor(data['subject']),
      );
      appointmentData.add(meetingData);
    }
    return appointmentData;
  }

  DateTime stringToDateTime(String string) {
    DateFormat format = DateFormat("dd/MM/yyyy HH:mm");
    return format.parse(string);
  }

  initializeColor(String tipo){
    if(tipo.contains('Piscina')){
      return Colors.indigoAccent;
    } else if(tipo.contains('Gita')){
      return Colors.green;
    } else if(tipo.contains('Inizio')){
      return Colors.deepPurpleAccent;
    } else if(tipo.contains('Fine')){
      return Colors.redAccent;
    } else if(tipo.contains('Festa')) {
      return Colors.teal;
    } else{
      return Colors.pinkAccent;
    }
  }
}




