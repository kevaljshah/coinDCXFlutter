import 'dart:async';

import 'alerts/alert_request.dart';
import 'alerts/alert_response.dart';


class AlertService {
  Function(AlertRequestInfo) _displayAlertListener;
  Completer<AlertResponseInfo> _alertClosed;

  void registerDialogListener(Function(AlertRequestInfo) showDialogListener) {
    _displayAlertListener = showDialogListener;
  }

  Future<AlertResponseInfo> showDialog(
      {String description, String buttonTitle = 'OK'}) {
    _alertClosed = Completer<AlertResponseInfo>();
    _displayAlertListener(AlertRequestInfo(
      description: description,
      buttonTitle: buttonTitle,
    ));
    return _alertClosed.future;
  }

  void dialogComplete(AlertResponseInfo response) {
    _alertClosed.complete(response);
    _alertClosed = null;
  }
}