import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../component/navigationdrawer_appbar.dart';
import 'calendar_viewmodel.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

bool showselect = false;

class CalendarViewScreen extends StackedView<CalendarViewModel> {
  const CalendarViewScreen({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CalendarViewModel viewModel,
    Widget? child,
  ) {
    CalendarViewModel viewModel = CalendarViewModel();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Calendario',
          style: TextStyle(
            fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.orange[400],
        elevation: 0,
      ),
      drawer: NavigationDrawerCustom(),
      body:FutureBuilder(
        future: viewModel.getDatafromGoogleSheet(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.data != null){
            return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: SfCalendar(
                      showNavigationArrow: true,
                      maxDate: DateTime(2024),
                      minDate: DateTime(2023),
                      selectionDecoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.orange, width: 2),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        shape: BoxShape.rectangle
                      ),
                      firstDayOfWeek: 7,
                      todayHighlightColor: Colors.orange,
                      view: CalendarView.month,
                      monthViewSettings: MonthViewSettings(showAgenda: true),
                      dataSource: MeetingDataSource(snapshot.data),
                      initialDisplayDate: DateTime.now(),
                    ),
                  ),
                )
            );
          } else{
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  CalendarViewModel viewModelBuilder(BuildContext context,) => CalendarViewModel();
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting>  source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting{
  Meeting({
    this.eventName,
    required this.from,
    required this.to,
    this.background,
    this.isAllDay = false
  });

  String? eventName;
  DateTime? from;
  DateTime? to;
  Color? background;
  bool? isAllDay;
}
