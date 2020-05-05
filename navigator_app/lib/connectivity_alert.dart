import 'package:flutter/cupertino.dart';
import 'package:navigatorapp/alert_service.dart';
import 'package:navigatorapp/connection_status.dart';
import 'package:provider/provider.dart';

class ConnectivityAlertDialog extends StatefulWidget {
  final Widget child;

  ConnectivityAlertDialog({
    this.child
  });

  @override
  _ConnectivityAlertDialogState createState() => _ConnectivityAlertDialogState();
}

class _ConnectivityAlertDialogState extends State<ConnectivityAlertDialog> {
  ConnectionStatus connectStat = ConnectionStatus.Offline;
  final AlertService _alertService = AlertService();

  getConnectStatus(BuildContext context) async {
    connectStat = await Provider.of<Future<ConnectionStatus>>(context);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    getConnectStatus(context);

    if(connectStat == ConnectionStatus.Wifi) {
      var dialogResult = _alertService.showDialog(
          description: 'Connected to Wifi');

      /*showCupertinoDialog(
          context: context,
        builder: (BuildContext context) => new CupertinoAlertDialog(
          title: new Text("Connectivity Alert"),
          content: new Text(""),
          actions: [
            CupertinoDialogAction(
                isDefaultAction: true,
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => false);
                })
          ],
        ),
      );*/
    }

    /*if (connectStat == ConnectionStatus.Cellular) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => new CupertinoAlertDialog(
          title: new Text("Connectivity Alert"),
          content: new Text("Connected to Cellular Data"),
          actions: [
            CupertinoDialogAction(
                isDefaultAction: true,
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => false);
                })
          ],
        ),
      );
    }

    if (connectStat == ConnectionStatus.ConnectedWithoutInternet) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => new CupertinoAlertDialog(
          title: new Text("Connectivity Alert"),
          content: new Text("Connected to network but do not have access to internet"),
          actions: [
            CupertinoDialogAction(
                isDefaultAction: true,
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => false);
                })
          ],
        ),
      );
    }


    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Connectivity Alert"),
        content: new Text("Not Connected"),
        actions: [
          CupertinoDialogAction(
              isDefaultAction: true,
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).popUntil((route) => false);
              }
          )
        ],
      ),
    );*/

    return Container();
  }
}