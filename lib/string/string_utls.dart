import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

String cutText(String text, int length) {
  text = text.trim();
  if (text.length > length) {
    return '${text.substring(0, length - 1)}..';
  }
  return text;
}

String randomId() {
  return const Uuid().v4();
}

logData(String msg) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('MM-dd HH:mm:ss').format(now);
  print("$formattedDate:$msg");
}

bool isPhoneCall(String input) {
  String cleanedInput = input.replaceAll(RegExp(r'[ -]'), '').toLowerCase();

  RegExp regex = RegExp(
    r'^tel:(\+?\d{1,3})?(\(?\d{1,4}\)?)?\d{6,}$',
    caseSensitive: false,
    multiLine: false,
  );

  return regex.hasMatch(cleanedInput);
}

bool isMailCall(String input) {
  String cleanedInput = input.replaceAll(RegExp(r'[ -]'), '');

  RegExp regex = RegExp(
    r'^mailto:[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    caseSensitive: false,
    multiLine: false,
  );

  return regex.hasMatch(cleanedInput);
}

bool isSmsCall(String input) {
  String cleanedInput = input.replaceAll(RegExp(r'[ -]'), '');

  RegExp regex = RegExp(
    r'^smsto:(\+?\d{1,3})?(\(?\d{1,4}\)?)?\d{6,}(?::.+)?$',
    caseSensitive: false,
    multiLine: false,
  );

  return regex.hasMatch(cleanedInput);
}

// bool isGeoCall(String input) {
//   String cleanedInput = input.replaceAll(RegExp(r'[ -]'), '');
//   RegExp regex = RegExp(
//     r'^geo:[-+]?([0-9]*\.[0-9]+|[0-9]+),\s*([-+]?([0-9]*\.[0-9]+|[0-9]+))$',
//     caseSensitive: false,
//     multiLine: false,
//   );
//   return regex.hasMatch(cleanedInput);
// }
