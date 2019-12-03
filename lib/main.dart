import 'package:flutter/material.dart';
import 'package:calendarflutter_app/square_calendar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calendar Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Builder(
        builder: (context) {
          return new Center(
            child:
            new SquareCalendar(
              year: 2016,
              month: 4,
              gestureBuilder: (child, int, date, base, first, last) {
                return new InkWell(
                  child: child,
                  onTap: () {
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text("tapped: " + date.toString()),
                    ));
                  },
                );
              },
              tileBuilder: (child, index, date, baseDate, firstDayOfMonth,
                  lastDayOfMonth) {
                return new GridTile(child: child);
              },
              widgetBuilder:
                  (index, date, baseDate, firstDayOfMonth, lastDayOfMonth) {
                return new Text(date.day.toString());
              },
            ),
          );
        },
      ),
    );
  }
}