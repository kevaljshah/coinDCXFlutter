import 'package:flutter/material.dart';
import 'package:navigatorapp/connection_service.dart';
import 'package:navigatorapp/connection_status.dart';
import 'package:navigatorapp/connectivity_alert.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Future<ConnectionStatus>>(
      builder: (context) => ConnectionService().connectionStatusStream,
      child: MaterialApp(
        builder: (context, widget) => Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => ConnectivityAlertDialog(
              child: widget,
            ),
          ),
        ),
        title: 'Navigation with Connectivity',
        theme: ThemeData.dark(),
        home: MarketDetailsView(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final int pageIndex = 0;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _gotoPage2() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConnectivityAlertDialog(
              child: Text(
                'This is Screen A',
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _gotoPage2,
        tooltip: 'Page2',
        child: Icon(Icons.chevron_right),
      ),
    );
  }
}
