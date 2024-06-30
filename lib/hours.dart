import 'package:flutter/material.dart';

class HoursSelector extends StatefulWidget {
  final String selectedDay;
  final List<bool> isCheckedList; // Define isCheckedList as a parameter
  final Function(List<String>) onHoursSelected;

  const HoursSelector({
    Key? key,
    required this.selectedDay,
    required this.isCheckedList,
    required this.onHoursSelected,
  }) : super(key: key);

  @override
  _HoursSelectorState createState() => _HoursSelectorState();
}

class _HoursSelectorState extends State<HoursSelector> {
  List<String> hoursOfDay = [
    '1 AM - 2 AM', '2 AM - 3 AM', '3 AM - 4 AM', '4 AM - 5 AM',
    '5 AM - 6 AM', '6 AM - 7 AM', '7 AM - 8 AM', '8 AM - 9 AM',
    '9 AM - 10 AM', '10 AM - 11 AM', '11 AM - 12 PM'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: hoursOfDay.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(18.0),
              margin: EdgeInsets.symmetric(vertical: 4.0),
              decoration: BoxDecoration(
                color: widget.isCheckedList[index] ? Colors.white : Colors.black,
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isCheckedList[index] = !widget.isCheckedList[index];
                      });
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.isCheckedList[index] ? Colors.black : Colors.white,
                      ),
                      child: Center(
                        child: widget.isCheckedList[index]
                            ? Icon(Icons.check, size: 24.0, color: Colors.white)
                            : Icon(Icons.add, size: 24.0, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    hoursOfDay[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      color: widget.isCheckedList[index] ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}