import 'package:curatrail/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class DobCalendarBottomSheet extends StatefulWidget {
  const DobCalendarBottomSheet({super.key});

  @override
  State<DobCalendarBottomSheet> createState() => _DobCalendarBottomSheetState();
}

class _DobCalendarBottomSheetState extends State<DobCalendarBottomSheet> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  final int _minYear = 1900;
  late final int _maxYear;

  @override
  void initState() {
    super.initState();
    _maxYear = DateTime.now().year;
  }

  void _prevMonth() {
    setState(() {
      _focusedDay = DateTime(
        _focusedDay.year,
        _focusedDay.month - 1,
        _focusedDay.day,
      );
    });
  }

  void _nextMonth() {
    if (!(_focusedDay.year == _maxYear &&
        _focusedDay.month == DateTime.now().month)) {
      setState(() {
        _focusedDay = DateTime(
          _focusedDay.year,
          _focusedDay.month + 1,
          _focusedDay.day,
        );
        if (_focusedDay.isAfter(DateTime.now())) {
          _focusedDay = DateTime.now();
        }
      });
    }
  }

  void _prevYear() {
    if (_focusedDay.year > _minYear) {
      setState(() {
        _focusedDay = DateTime(
          _focusedDay.year - 1,
          _focusedDay.month,
          _focusedDay.day,
        );
      });
    }
  }

  void _nextYear() {
    if (_focusedDay.year < _maxYear) {
      setState(() {
        _focusedDay = DateTime(
          _focusedDay.year + 1,
          _focusedDay.month,
          _focusedDay.day,
        );
        if (_focusedDay.isAfter(DateTime.now())) {
          _focusedDay = DateTime.now();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorF5FAFF,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: SafeArea(
        child: Column(
          children: [

            // Month & Year header
            Row(
              children: [

                // Month controls
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        color: AppColors.color49454F,
                      ),
                      onPressed: _prevMonth,
                    ),

                    DropdownButton<int>(
                      underline: SizedBox(),
                      value: _focusedDay.month,
                      items: List.generate(12, (i) {
                        final d = DateTime(_focusedDay.year, i + 1);
                        return DropdownMenuItem(
                          value: i + 1,
                          child: Text(
                            DateFormat.MMM().format(d),
                            style: Get.textTheme.titleMedium?.copyWith(
                              color: AppColors.color49454F,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }),
                      onChanged: (m) {
                        if (m == null) return;
                        DateTime newDate = DateTime(_focusedDay.year, m, _focusedDay.day);
                        if (newDate.isAfter(DateTime.now())) {
                          newDate = DateTime.now();
                        }
                        setState(() => _focusedDay = newDate);
                      },
                    ),

                    IconButton(
                      icon: Icon(
                        Icons.chevron_right,
                        color: AppColors.color49454F,
                      ),
                      onPressed: _nextMonth,
                    ),
                  ],
                ),

                Spacer(),

                // Year controls
                Row(
                  children: [

                    IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        color: AppColors.color49454F,
                      ),
                      onPressed: _prevYear,
                    ),

                    DropdownButton<int>(
                      underline: SizedBox(),
                      value: _focusedDay.year,
                      items: List.generate(_maxYear - _minYear + 1, (i) {
                        final y = _minYear + i;
                        return DropdownMenuItem(
                          value: y,
                          child: Text(
                            y.toString(),
                            style: Get.textTheme.titleMedium?.copyWith(
                              color: AppColors.color49454F,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }),
                      onChanged: (y) {
                        if (y == null) return;
                        DateTime newDate = DateTime(y, _focusedDay.month, _focusedDay.day);
                        if (newDate.isAfter(DateTime.now())) {
                          newDate = DateTime.now();
                        }
                        setState(() => _focusedDay = newDate);
                      },
                    ),

                    IconButton(
                      icon: Icon(
                        Icons.chevron_right,
                        color: AppColors.color49454F,
                      ),
                      onPressed: _nextYear,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 6),

            // Calendar grid
            Expanded(
              child: TableCalendar(
                firstDay: DateTime.utc(_minYear, 1, 1),
                lastDay: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
                focusedDay: _focusedDay,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                headerStyle: HeaderStyle(
                  titleCentered: false,
                  formatButtonVisible: false,
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                  headerPadding: EdgeInsets.zero,
                  titleTextStyle: Get.textTheme.titleLarge!.copyWith(
                    color: AppColors.transparent,
                    fontSize: 5,
                  ),
                ),
                daysOfWeekHeight: 50,
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    if (day.isAfter(DateTime.now())) {
                      return Center(
                        child: Text(
                          '${day.day}',
                          style: Get.textTheme.titleLarge!.copyWith(
                            color: AppColors.colorD9D9D9,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                  dowBuilder: (context, day) {
                    final text = DateFormat.E().format(day)[0];
                    return Center(
                      child: Text(
                        text,
                        style: Get.textTheme.titleLarge!.copyWith(
                          color: AppColors.color49454F,
                          fontSize: 17,
                        ),
                      ),
                    );
                  },
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: Get.textTheme.titleLarge!.copyWith(
                    color: AppColors.color49454F,
                    fontSize: 16,
                  ),
                  weekendStyle: Get.textTheme.titleLarge!.copyWith(
                    color: AppColors.color49454F,
                    fontSize: 16,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  defaultTextStyle: Get.textTheme.titleLarge!.copyWith(
                    color: AppColors.color49454F,
                    fontSize: 16,
                  ),
                  outsideTextStyle: Get.textTheme.titleLarge!.copyWith(
                    color: AppColors.colorD9D9D9,
                    fontSize: 16,
                  ),
                  weekendTextStyle: Get.textTheme.titleLarge!.copyWith(
                    color: AppColors.color49454F,
                    fontSize: 16,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: AppColors.themeColor,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: Get.textTheme.titleLarge!.copyWith(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                  todayDecoration: BoxDecoration(
                    color: AppColors.themeColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: Get.textTheme.titleLarge!.copyWith(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),

                selectedDayPredicate: (day) => _selectedDay != null && isSameDay(_selectedDay, day),

                onDaySelected: (selectedDay, focusedDay) {
                  if (selectedDay.isAfter(DateTime.now())) return;
                  if (selectedDay.month != _focusedDay.month) return;

                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },

                onPageChanged: (focusedDay) {
                  if (focusedDay.isAfter(DateTime.now())) {
                    _focusedDay = DateTime.now();
                  } else {
                    _focusedDay = focusedDay;
                  }
                },
              ),
            ),

            // Bottom actions
            Row(
              children: [

                TextButton(
                  onPressed: () => setState(() => _selectedDay = null),
                  child: Text(
                    'Clear',
                    style: Get.textTheme.titleLarge!.copyWith(
                      color: AppColors.color49454F,
                      fontSize: 16,
                    ),
                  ),
                ),

                Spacer(),

                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Cancel',
                    style: Get.textTheme.titleLarge!.copyWith(
                      color: AppColors.color49454F,
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(width: 8),

                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(_selectedDay);
                  },
                  child: Text(
                    'OK',
                    style: Get.textTheme.titleLarge!.copyWith(
                      color: AppColors.color49454F,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
