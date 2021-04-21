import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie/models/MyModel.dart';
import 'package:movie/pages/cinemas/cinema_next_local_widgets/build_InsertPersonalInfo.dart';
import 'package:movie/pages/cinemas/cinema_next_local_widgets/build_appBar.dart';
import 'package:movie/pages/cinemas/cinema_next_local_widgets/build_dateTimePicker.dart';
import 'package:movie/pages/cinemas/cinema_next_local_widgets/build_orderDetail.dart';
import 'package:provider/provider.dart';

class CinemaNext extends StatefulWidget {
  @override
  _CinemaNextState createState() => _CinemaNextState();
}

class _CinemaNextState extends State<CinemaNext> {

  String _dropdownValue;
  var datePicked;
  int currentYear = int.parse(DateFormat('yyyy').format(DateTime.now()));
  var timePicked;
  int hour = int.parse(DateFormat('hh').format(DateTime.now()));
  int minute = int.parse(DateFormat('mm').format(DateTime.now()));
  String timeText;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController selectPaymentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding : false,
        backgroundColor: Colors.black,
        appBar: buildAppBar(context),
        body: OrientationBuilder(
          builder: (context, orientation){
            return orientation == Orientation.portrait ? _buildBody : _buildBodyLandscape;
          }
        ),
      ),
    );
  }

  get _buildBody{
    double subValue = AppBar().preferredSize.height + MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom + 10 + 26 + 20 + 70;
    return Container(
      height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BuildDateTimePicker(subValue: subValue),
            BuildInsertPersonalInfo(nameController: nameController, phoneController: phoneController, selectPaymentController: selectPaymentController, subValue: subValue),
            buildOrderDetail(context, subValue),
            Container(
              margin: EdgeInsets.only(right: 15),
              height: 22,
              width: MediaQuery.of(context).size.width,
              child: RichText(
                text: TextSpan(
                  text: 'សរុប : ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'KhmerOSbattambang',
                  ),
                  children: <TextSpan>[
                    TextSpan(text: '\$250​', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
              alignment: Alignment.topRight,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 18),
              height: 68,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.black,
                onPressed: (){
                  return showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('បញ្ចាក់', style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: 'KhmerOSbattambang',
                          fontSize: 16
                        ),),
                        content: Container(
                          child: Text('ការទូទាត់ទទួលបានជោកជ័យ\nសូមអរគុណ!!!', style: TextStyle(
                            fontFamily: 'KhmerOSbattambang',
                          ),),
                        ),
                        actions: [
                          RaisedButton(
                            onPressed: (){
                              nameController.text = '';
                              phoneController.text = '';
                              setState(() {
                                dropdownValue = null;
                                buildDateTimePickerKey.currentState.datePicked = null;
                                buildDateTimePickerKey.currentState.timePicked = null;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text('        បន្ត        ', style: TextStyle(
                              fontFamily: 'KhmerOSbattambang',
                            ),),
                            color: Colors.red,
                          ),
                        ],
                      );
                    }
                  );
                },
                child: Text('បន្ត', style: TextStyle(
                  fontSize: 16,
                    fontFamily: 'KhmerOSbattambang',
                    color: Colors.white
                ),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  get _buildBodyLandscape{
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 165,
                width: (MediaQuery.of(context).size.width) * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 14),
                      child: Row(
                        children: [
                          InkWell (
                            child: Icon(Icons.date_range_sharp, color: Colors.red, size: 32),
                            onTap: (){
                              showDatePicker(
                                  context: context,
                                  initialDate: datePicked == null ? DateTime.now() : datePicked,
                                  firstDate: DateTime(currentYear - 5),
                                  lastDate: DateTime(currentYear + 5),
                                  builder: (BuildContext context, Widget child){
                                    return Theme(
                                      data: ThemeData(
                                        primarySwatch: Colors.red,
                                      ),
                                      child: child,
                                    );
                                  }
                              ).then((date) {
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
                            width: (MediaQuery.of(context).size.width ) * 0.55,
                            child: Text(datePicked == null ? 'Date Picker' : DateFormat('dd-MMMM-yyyy').format(datePicked), style: TextStyle(
                              color: datePicked == null ? Colors.black.withOpacity(0.6) : Colors.black,
                            ),),
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
                            onTap: (){
                              showTimePicker(
                                  context: context,
                                  initialTime: timePicked == null ? TimeOfDay(hour: hour, minute: minute) : timePicked,
                                  builder: (BuildContext context, Widget child){
                                    return Theme(
                                      data: ThemeData(
                                        primarySwatch: Colors.red,
                                      ),
                                      child: child,
                                    );
                                  }
                              ).then((time){
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
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Text(timePicked == null ? 'Time Picker' : '$timeText', style: TextStyle(
                              color: timePicked == null ? Colors.black.withOpacity(0.6) : Colors.black,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 270,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('បញ្ចូលព័ត៏មានផ្ទាល់ខ្លួន', style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'KhmerOSbattambang',
                      ),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 14, top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.people, color: Colors.red, size: 32),
                          Container(
                            height: 39,
                            width: MediaQuery.of(context).size.width * 0.55,
                            margin: EdgeInsets.only(left: 10),
                            child: Form(
                              child: TextField(
                                controller: nameController,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter your name',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(color: Colors.grey[300]),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Colors.grey[300]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 14, top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.phone, color: Colors.red, size: 32),
                          Container(
                            height: 39,
                            width: MediaQuery.of(context).size.width * 0.55,
                            margin: EdgeInsets.only(left: 10),
                            child: Form(
                              child: TextFormField(
                                controller: phoneController,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter your phone number',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(color: Colors.grey[300]),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Colors.grey[300]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 14, top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.payments_outlined, color: Colors.red, size: 32),
                          Container(
                            height: 39,
                            width: MediaQuery.of(context).size.width * 0.55,
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Colors.white,
                            ),
                            child: DropdownButton<String>(
                              hint: Center(
                                child: Text('Select payment', style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                ),),
                              ),
                              value: _dropdownValue,
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              underline: SizedBox(),
                              onChanged: (String newValue) {
                                setState(() {
                                  _dropdownValue = newValue;
                                });
                              },
                              items: <String>['Master Card', 'ABA', 'ACLEDA', 'AMK']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Center(child: Text(value, textAlign: TextAlign.center)),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 200,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.only(left: 55, top: 0, bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'រោងកុន : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'KhmerOSbattambang',
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Legend Cinema', style: TextStyle(color: Colors.white, fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(height: 7),
                      RichText(
                        text: TextSpan(
                          text: 'លេខកៅអី : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'KhmerOSbattambang',
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '10, 20, 30, 45', style: TextStyle(color: Colors.white, fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(height: 7),
                      RichText(
                        text: TextSpan(
                          text: 'ការបរិច្ឆេត : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'KhmerOSbattambang',
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '12-May-2021', style: TextStyle(color: Colors.white, fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(height: 7),
                      RichText(
                        text: TextSpan(
                          text: 'ម៉ោង : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'KhmerOSbattambang',
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '10:35 នាទី', style: TextStyle(color: Colors.white, fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 15),
                height: 28,
                width: MediaQuery.of(context).size.width * 0.7,
                child: RichText(
                  text: TextSpan(
                    text: 'សរុប : ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'KhmerOSbattambang',
                    ),
                    children: <TextSpan>[
                      TextSpan(text: '\$250​', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
                alignment: Alignment.topRight,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 18),
                height: 70,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.black,
                  onPressed: (){
                    return showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('បញ្ចាក់', style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'KhmerOSbattambang',
                                fontSize: 16
                            ),),
                            content: Container(
                              child: Text('ការទូទាត់ទទួលបានជោកជ័យ\nសូមអរគុណ!!!', style: TextStyle(
                                fontFamily: 'KhmerOSbattambang',
                              ),),
                            ),
                            actions: [
                              RaisedButton(
                                onPressed: (){
                                  nameController.text = '';
                                  phoneController.text = '';
                                  setState(() {
                                    _dropdownValue = null;
                                    datePicked = null;
                                    timePicked = null;
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text('        បន្ត        ', style: TextStyle(
                                  fontFamily: 'KhmerOSbattambang',
                                ),),
                                color: Colors.red,
                              ),
                            ],
                          );
                        }
                    );
                  },
                  child: Text('បន្ត', style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'KhmerOSbattambang',
                      color: Colors.white
                  ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
