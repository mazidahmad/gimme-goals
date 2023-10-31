import 'package:intl/intl.dart';

class DateUtil {
  static String getFormattedDate(DateTime date) {
    DateFormat df = DateFormat('MMM dd, yyyy');
    return df.format(date).toString();
  }

  static String getSimpleFormattedDate(DateTime date) {
    DateFormat df = DateFormat('yyyy-MM-dd');
    return df.format(date).toString();
  }

  static DateTime getDateWithoutTime(DateTime date) {
    DateFormat df = DateFormat('yyyy-MM-dd');
    return DateTime.parse(df.format(date).toString());
  }
}
