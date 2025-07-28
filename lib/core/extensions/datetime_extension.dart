import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get hoursMinutesText => DateFormat('HH:mm').format(this);
}
