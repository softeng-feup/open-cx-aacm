
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'forum.dart';
import 'info.dart';
import 'objects.dart';

import 'package:table_calendar/table_calendar.dart';


class HomePage extends StatefulWidget {

  HomePage(this.title, this.info) {
    print(this.info.currentUser.getName());
  }

  static String tag = 'home-page';
  final String title;
  final AllInfo info;

  @override
  MyHomePage createState() => MyHomePage(info);
}


class MyHomePage extends State<HomePage>  with TickerProviderStateMixin  {
  MyHomePage(this.info);
  AllInfo info;
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

   @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _events = {};

    //upload all events to a map
    for(int i=0; i<info.getAllLectures().length;i++){
      if(_events.keys.contains(info.getAllLectures()[i].getDate())){
        List values = _events[info.getAllLectures()[i].getDate()];
        values.add(info.getAllLectures()[i].getName());
        _events[info.getAllLectures()[i].getDate()] = values;
      }
      else{
        final Map<DateTime, List> _temp = {info.getAllLectures()[i].getDate(): [info.getAllLectures()[i].getName()]};
        _events.addAll(_temp);
      }   
    }

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }
  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }
   void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });

  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
           _buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      initialCalendarFormat: CalendarFormat.week,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.lightBlue[400],
        todayColor: Colors.deepOrange[300],
        markersColor: Colors.lightBlue[700],
        outsideDaysVisible: false,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.deepOrange[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Color(0xFF3EA6F2),
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Color(0xFF3EA6F2),
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];
          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }
          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _calendarController.isSelected(date)
            ? Colors.deepOrange[500]
            : _calendarController.isToday(date) ? Colors.deepOrange[300] : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  subtitle: Text(info.getLectureInfo(event)),
                  onTap: () =>{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Forum(info,event, info.getLecture(event).getText())))
                  }
                ),
              ))
          .toList(),
    );
  }
}




