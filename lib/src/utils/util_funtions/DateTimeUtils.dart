import 'package:everyday_invest/src/utils/enums/StockEnums.dart';
import 'package:flutter/material.dart';

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

  bool isBeforeMarketLive(DateTime date) {
    print("isBeforeMarketLive");
    TimeOfDay now = TimeOfDay.now();
    return ((now.hour < 9) || (now.hour == 9 && now.minute <= 30));
  }

    bool isValidTimeRange(DateTime time, StockTime timeType) {
    TimeOfDay startTime = timeType == StockTime.Indian
        ? TimeOfDay(hour: 9, minute: 30)
        : TimeOfDay(hour: 19, minute: 0);
    TimeOfDay endTime = timeType == StockTime.Indian
        ? TimeOfDay(hour: 16, minute: 0)
        : TimeOfDay(hour: 24, minute: 0);
    return ((time.hour > startTime.hour) ||
            (time.hour == startTime.hour && time.minute >= startTime.minute)) &&
        ((time.hour < endTime.hour) ||
            (time.hour == endTime.hour && time.minute <= endTime.minute));
  }

  DateTime lastOpenTime() {
    print("lastOpenTime");
    // Set initial time to 4pm today
    DateTime result =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    if (DateTimeUtils().isBeforeMarketLive(DateTime.now())) {
      print("Trading has not begun today, getting data for yesterday");
      result = result.subtract(const Duration(days: 1));
    }

    while (!DateTimeUtils().isValidTradeDay(result)) {
      // Check if today is a holiday
      if (DateTimeUtils().checkForHolidayOnDate(result)) {
        print("Today is a holiday");
        result = result.subtract(const Duration(days: 1));
      }
      // Return 4pm last Friday if today is Sunday or Saturday
      if (result.weekday == 7) {
        // Sunday
        print("Today is a Sunday");
        result = result.subtract(const Duration(days: 2));
      } else if (result.weekday == 6) {
        // Saturday
        print("Today is a Saturday");
        result = result.subtract(const Duration(days: 1));
      }
    }
    print(result);
    return result;
  }

  bool isValidTradeDay(DateTime date) {
    bool isWeekday = date.weekday >= 1 && date.weekday <= 5;
    bool isHoliday = DateTimeUtils().checkForHolidayOnDate(date);

    return isWeekday && !isHoliday;
  }
}
