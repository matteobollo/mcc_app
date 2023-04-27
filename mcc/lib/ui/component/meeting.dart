import 'dart:ui';

class Meeting{
  Meeting({
    this.eventName,
    required this.from,
    required this.to,
    this.background,
    this.isAllDay = false
  });

  String? eventName;
  DateTime? from;
  DateTime? to;
  Color? background;
  bool? isAllDay;
}
