extension ExtDate on DateTime {
  bool isSameYearAndMonth(DateTime date) =>
      year == date.year && month == date.month;
}
