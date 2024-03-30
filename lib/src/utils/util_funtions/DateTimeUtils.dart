class DateTimeUtils {
  final List<DateTime> _holidayList = [DateTime(2024, 3, 29)];

  bool checkForHolidayOnDate(DateTime date) {
    for (var holiday in _holidayList) {
      if (areSameDateFast(date, holiday)) return true;
    }

    return false;
  }

  bool areSameDateFast(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }
}
