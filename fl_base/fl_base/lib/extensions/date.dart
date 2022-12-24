import 'package:intl/intl.dart';

extension FormatDate on DateTime {
  DateTime get toGM7 => add(const Duration(hours: 7));

  String formatTimeServer() {
    final DateFormat formatter = DateFormat('yyyyMMdd');
    return formatter.format(this);
  }

  int formatTimeServerToNumber() {
    final DateFormat formatter = DateFormat('yyyyMMdd');
    return int.parse(formatter.format(this));
  }

  String formatDDMMYYYY({String pattern = '/'}) {
    final DateFormat formatter = DateFormat('dd${pattern}MM${pattern}yyyy');
    return formatter.format(this);
  }

  String formatDDMMYYYYgM7({String pattern = '/'}) {
    final DateFormat formatter = DateFormat('dd${pattern}MM${pattern}yyyy');
    return formatter.format(toGM7);
  }

  String formatHhMMSSgM7({String pattern = ':'}) {
    final DateFormat formatter = DateFormat('HH${pattern}mm${pattern}ss');
    return formatter.format(toGM7);
  }

  String formatHhMmSS({String pattern = ':'}) {
    final DateFormat formatter = DateFormat('HH${pattern}mm${pattern}ss');
    return formatter.format(this);
  }

  String formatHhMM({String pattern = ':'}) {
    final DateFormat formatter = DateFormat('HH${pattern}mm');
    return formatter.format(this);
  }

  String get formatSS {
    final DateFormat formatter = DateFormat('ss');
    return formatter.format(this);
  }

  String get formatYYYYMMddFromNow {
    final DateFormat formatter = DateFormat('yyyyMMdd');
    return formatter.format(this);
  }

  String get formatDDMmYYYYHhMM {
    return DateFormat('dd/MM/yyyy HH:mm').format(this);
  }

  String get formatYYYYMMDD {
    return DateFormat('yyyyMMdd').format(this);
  }

  // static DateTime nowServerTimeGMT7() {
  //   final int diff = GlobalDataManager().diffTime ?? 0;
  //   final DateTime now =
  //       DateTime.now().add(Duration(milliseconds: diff)).toGMT7();
  //   return now;
  // }

  DateTime toGMT7() {
    return toUtc().add(const Duration(hours: 7));
  }
}
