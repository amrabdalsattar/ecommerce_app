import 'package:intl/intl.dart';

String numbersFormat(num number) {
  if (number >= 1000) {
    return NumberFormat('#,##0').format((number));
  } else {
    return number.toString();
  }
}

String getFirstName(String name) {
  List<String> nameParts = name.split(' ');
  if (nameParts.isNotEmpty) {
    return nameParts[0];
  } else {
    return '';
  }
}