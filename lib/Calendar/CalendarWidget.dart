import 'package:what_todo/Calendar/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:what_todo/Calendar/event_data_source.dart';
import 'package:what_todo/Calendar/tasks_widget.dart';
import '../events.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final events = Provider.of<EventProvider>(context).events;
    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      headerStyle: CalendarHeaderStyle(
        textAlign: TextAlign.center,
        backgroundColor: Color(0xff5b418f),
        textStyle: TextStyle(
          fontSize: 25,
          fontStyle: FontStyle.normal,
          letterSpacing: 5,
          color: Color(0xFFff5eaea),
          fontWeight: FontWeight.w500,),
      ),
      appointmentTextStyle: TextStyle(
        fontSize: 14,
        color: Colors.white,
        letterSpacing: 2,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      todayHighlightColor: Color(0xff5b418f),
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Color(0xffd0d2d8),
      onLongPress: (details) {
        final provider = Provider.of<EventProvider>(context, listen: false);

        provider.setDate(details.date);

        showModalBottomSheet(
          context: context,
          builder: (context) => TasksWidget(),
        );
      },
    );
  }
}
