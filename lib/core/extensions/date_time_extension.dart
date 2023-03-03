extension DateTimeExtension on DateTime {
  String get dateToIDayIMonthIYearIHourIMinute {
    return "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year, ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }
}
