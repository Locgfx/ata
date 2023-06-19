import 'notification_seen_api.dart';

class NotificationSeenRepo {
  final NotificationSeenApi _repo = NotificationSeenApi();
  bool _retVal = false;
  Future<bool> seenAll() async {
    final res = await _repo.get(notificationId: "all");
    if (res == false) {
      _retVal = false;
    } else {
      if (res['status'] == true) {
        _retVal = true;
      } else {
        _retVal = false;
      }
    }
    return _retVal;
  }
}
