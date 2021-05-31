import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final buildDateTimePickerKey = GlobalKey<_BuildDateTimePickerState>();

class BuildDateTimePicker extends StatefulWidget {
  final double subValue;
  BuildDateTimePicker({this.subValue});
  final Key key = buildDateTimePickerKey;
  final dateFocusNode = FocusNode();

  @override
  _BuildDateTimePickerState createState() => _BuildDateTimePickerState();
}

class _BuildDateTimePickerState extends State<BuildDateTimePicker> {
  var datePicked;
  int currentYear = int.parse(DateFormat('yyyy').format(DateTime.now()));
  var timePicked;
  int hour = int.parse(DateFormat('hh').format(DateTime.now()));
  int minute = int.parse(DateFormat('mm').format(DateTime.now()));
  String timeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      height: (MediaQuery.of(context).size.height - widget.subValue) * 0.27,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 14),
            child: Row(
              children: [
                InkWell(
                  child:
                      Icon(Icons.date_range_sharp, color: Colors.red, size: 32),
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate:
                            datePicked == null ? DateTime.now() : datePicked,
                        firstDate: DateTime(currentYear - 5),
                        lastDate: DateTime(currentYear + 5),
                        builder: (BuildContext context, Widget child) {
                          return Theme(
                            data: ThemeData(
                              primarySwatch: Colors.red,
                            ),
                            child: child,
                          );
                        }).then((date) {
                      setState(() {
                        datePicked = date;
                      });
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width - 95,
                  child: Text(
                    datePicked == null
                        ? 'Date Picker'
                        : DateFormat('dd-MMMM-yyyy').format(datePicked),
                    style: TextStyle(
                      color: datePicked == null
                          ? Colors.black.withOpacity(0.6)
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 10, right: 14, top: 5),
            child: Row(
              children: [
                InkWell(
                  child: Icon(Icons.timer, color: Colors.red, size: 32),
                  onTap: () {
                    showTimePicker(
                        context: context,
                        initialTime: timePicked == null
                            ? TimeOfDay(hour: hour, minute: minute)
                            : timePicked,
                        builder: (BuildContext context, Widget child) {
                          return Theme(
                            data: ThemeData(
                              primarySwatch: Colors.red,
                            ),
                            child: child,
                          );
                        }).then((time) {
                      setState(() {
                        timePicked = time;
                        timeText = time.format(context);
                      });
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width - 95,
                  child: Text(
                    timePicked == null ? 'Time Picker' : '$timeText',
                    style: TextStyle(
                      color: timePicked == null
                          ? Colors.black.withOpacity(0.6)
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
