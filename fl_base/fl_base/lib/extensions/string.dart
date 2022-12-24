import 'package:intl/intl.dart';

extension StringEx on String {
  bool get isString => RegExp('[a-zA-Z]').hasMatch(this);

  bool get validCharSpec => RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);

  String formatDecimal(String s) {
    return s.replaceAll('', '');
  }

  String formatToDDMMYYYY() {
    final DateTime dateTime = DateTime.parse(this);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  String formatToDDMMYYYYs() {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.tryParse(this) ?? 0);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  String formatToHhMmMS() {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.tryParse(this) ?? 0);
    final DateFormat formatter = DateFormat('hh:mm:ss');
    return formatter.format(dateTime);
  }

  String formatToYYYYHhMM() {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.tryParse(this) ?? 0);
    final DateFormat formatter = DateFormat('yyyy/MM/dd');
    return formatter.format(dateTime);
  }

  String formatToYearTime() {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.tryParse(this) ?? 0);
    final DateFormat formatter = DateFormat('yyyy/MM/dd hh:mm:ss');
    return formatter.format(dateTime);
  }

  String formatToMmDdHhMM() {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.tryParse(this) ?? 0);
    final DateFormat formatter = DateFormat('MM/dd hh:mm');
    return formatter.format(dateTime);
  }

  String replaceSemicolon({String fromDecimal = ',', String toDecimal = ''}) {
    return replaceAll(fromDecimal, toDecimal);
  }

  num formatNumber() {
    return num.tryParse(replaceSemicolon()) ?? 0;
  }

  double get parseNumeric => double.parse(this);

  bool validateEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool validateMobile() {
    return RegExp(r'(0[3|5|7|8|9])+([0-9]{8})\b').hasMatch(this);
  }
}

extension StringExNull on String? {
  bool get isStringNotEmpty => this != null && this!.trim().isNotEmpty;

  bool get isStringEmpty => this != null && this!.trim().isEmpty;

  bool get isString => RegExp('[a-zA-Z]').hasMatch(this!);

  bool get isNumeric {
    if (this == null) {
      return false;
    }
    return double.tryParse(this!) != null;
  }
}
