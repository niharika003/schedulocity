import 'package:what_todo/Calendar/CalendarWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/Calendar/event_editing_page.dart';
import 'package:what_todo/Calendar/event_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => EventProvider(),
        child: MaterialApp(
          title: 'CALENDAR',
          themeMode: ThemeMode.light,
          theme: ThemeData(
            fontFamily: GoogleFonts.raleway().fontFamily,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Color(0xff5b418f),
            accentColor: Color(0xff5b418f),
          ),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Color(0xff5b418f),
        centerTitle: true,
      ),
      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xff5b418f),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EventEditingPage()),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, color: Colors.white),
              label: 'Calendar',

            backgroundColor: Color(0xff5b418f),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task_rounded,  color: Color(0xffd0d2d8)),
            label: 'TO_DO',
            backgroundColor: Color(0xff5b418f),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,  color: Color(0xffd0d2d8)),
            label: 'Q/A',
            backgroundColor: Colors.red,
          ),
        ],
        backgroundColor: Color(0xff5b418f),
        selectedFontSize: 18.0,
        selectedItemColor: Colors.white,
        unselectedFontSize: 15.0,
        unselectedItemColor: Color(0xffd0d2d8),
      ),
    );
  }
}

