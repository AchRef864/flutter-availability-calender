import 'package:flutter/material.dart';
import 'constants.dart';
import 'hours.dart';

class DaysSelector extends StatefulWidget {
  const DaysSelector({Key? key}) : super(key: key);

  @override
  State<DaysSelector> createState() => _DaysSelectorState();
}

class _DaysSelectorState extends State<DaysSelector> {
  late List<bool> sundayHoursChecked = List<bool>.filled(hoursOfDay.length, false);
  late List<bool> mondayHoursChecked = List<bool>.filled(hoursOfDay.length, false);
  late List<bool> tuesdayHoursChecked = List<bool>.filled(hoursOfDay.length, false);
  late List<bool> wednesdayHoursChecked = List<bool>.filled(hoursOfDay.length, false);
  late List<bool> thursdayHoursChecked = List<bool>.filled(hoursOfDay.length, false);
  late List<bool> fridayHoursChecked = List<bool>.filled(hoursOfDay.length, false);
  late List<bool> saturdayHoursChecked = List<bool>.filled(hoursOfDay.length, false);

  late Map<String, List<bool>> checkedHoursMap = {
    'Sun': sundayHoursChecked,
    'Mon': mondayHoursChecked,
    'Tue': tuesdayHoursChecked,
    'Wed': wednesdayHoursChecked,
    'Thu': thursdayHoursChecked,
    'Fri': fridayHoursChecked,
    'Sat': saturdayHoursChecked,
  };

  String? selectedDay;

  void saveSelectedHours(List<String> selectedHours) {
    if (selectedDay != null) {
      setState(() {
        checkedHoursMap[selectedDay!] = List<bool>.generate(hoursOfDay.length, (index) => selectedHours.contains(hoursOfDay[index]));
      });

      // Simulate storing data in a database (Replace this with actual database integration)
      _simulateDatabaseStorage(selectedDay!, selectedHours);

      print('Selected hours for $selectedDay: ${selectedHours.toString()}');
    }
  }

  // Simulate storing data in a database
  void _simulateDatabaseStorage(String day, List<String> selectedHours) {
    // Replace this with actual database storage logic
    // Example: YourDatabaseService.saveHours(day, selectedHours);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Data Saved'),
          content: Text("Selected hours for $day have been saved to the database.(I didn't do the database part though)"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Center(
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: daysOfWeek.length,
                    itemBuilder: (context, index) {
                      final day = daysOfWeek[index];
                      final isSelected = selectedDay == day;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = day;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6.0),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white : Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              day,
                              style: TextStyle(
                                color: isSelected ? Colors.black : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            if (selectedDay != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: HoursSelector(
                  selectedDay: selectedDay!,
                  isCheckedList: checkedHoursMap[selectedDay!]!,
                  onHoursSelected: saveSelectedHours,
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: selectedDay != null,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 18.0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black, width: 2.0),
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              saveSelectedHours([]);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: 22.0, horizontal: 24.0),
              ),
            ),
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
