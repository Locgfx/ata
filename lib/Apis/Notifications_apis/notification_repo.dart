import 'check_notification_api.dart';

class NotificationRepo {
  final CheckNotificationApi _message = CheckNotificationApi();
  bool _retVal = false;
  Future<bool> newNotification() async {
    final resp = await _message.get();
    if (resp == false) {
      _retVal = false;
    } else {
      //log("new msg $resp");
      if (resp['status'] == true) {
        _retVal = true;
      } else {
        _retVal = false;
      }
    }
    return _retVal;
  }
}
