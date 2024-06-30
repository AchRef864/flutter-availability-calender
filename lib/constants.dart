// constants.dart

import 'package:flutter/material.dart';

List<String> hoursOfDay = [
  '1 AM - 2 AM', '2 AM - 3 AM', '3 AM - 4 AM', '4 AM - 5 AM',
  '5 AM - 6 AM', '6 AM - 7 AM', '7 AM - 8 AM', '8 AM - 9 AM',
  '9 AM - 10 AM', '10 AM - 11 AM', '11 AM - 12 PM'
];

List<bool> isCheckedList = List<bool>.generate(hoursOfDay.length, (index) => false);

List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
