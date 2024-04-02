import 'package:intl/intl.dart';

int getCurrentTimestampInMillionSecond() =>
    DateTime.now().millisecondsSinceEpoch;

String formatDateFromTimestamp(int timestamp) {
  var dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat('yyyy-MM-dd').format(dt);
}
