import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../component/appbar_custom.dart';
import '../../component/meetingdata.dart';
import '../../component/navigationdrawer_appbar.dart';
import 'calendar_viewmodel.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
      backgroundColor: Colors.orange[400],
      appBar: AppBarCustom.appBarBackButton(context, 'Calendario'),
      body: Container(
        child: Container(
          height: 800,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: FutureBuilder(
            future: viewModel.getDatafromGoogleSheet(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.data != null){
                return Padding(
                  padding: const EdgeInsets.only(left:20.0, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 540,
                              child: SfCalendar(
                                showNavigationArrow: true,
                                maxDate: DateTime(2024),
                                minDate: DateTime(2023),
                                initialSelectedDate: DateTime.now(),
                                timeSlotViewSettings: TimeSlotViewSettings(
                                  startHour: 7,
                                  endHour: 24,
                                  timeFormat: 'HH:mm'
                                ),
                                selectionDecoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.orange, width: 2),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  shape: BoxShape.rectangle
                                ),
                                firstDayOfWeek: 7,
                                todayHighlightColor: Colors.orange,
                                view: viewModel.getView,
                                allowedViews: [
                                  CalendarView.week,
                                  CalendarView.month
                                ],
                                monthViewSettings: MonthViewSettings(showAgenda: true,),
                                dataSource: MeetingDataSource(snapshot.data),
                                appointmentTimeTextFormat: 'HH:mm',
                                initialDisplayDate: DateTime.now(),
                              ),
                            ),

                          ],
                  ),
                );
              } else{
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                    backgroundColor: Color(0xFF555556),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  CalendarViewModel viewModelBuilder(BuildContext context,) => CalendarViewModel();
}

