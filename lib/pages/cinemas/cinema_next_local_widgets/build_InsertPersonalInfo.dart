import 'package:flutter/material.dart';
import 'package:movie/models/MyModel.dart';
import 'package:provider/provider.dart';


class BuildInsertPersonalInfo extends StatelessWidget {

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController selectPaymentController;
  final double subValue;
  // final String dropdownValue;

  BuildInsertPersonalInfo({this.nameController, this.phoneController, this.selectPaymentController, this.subValue});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5, top: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        height: (MediaQuery.of(context).size.height - subValue) * 0.44,
        width: MediaQuery.of(context).size.width,
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
                    width: MediaQuery.of(context).size.width - 95,
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
                    width: MediaQuery.of(context).size.width - 95,
                    margin: EdgeInsets.only(left: 10),
                    child: Form(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
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
                    width: MediaQuery.of(context).size.width - 95,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                    ),
                    child: Consumer<MyModel>(
                      builder: (context, myModel, child){
                        return DropdownButton<String>(
                          hint: Text('\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tSelect payment', style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                          ),),
                          value: dropdownValue,
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: SizedBox(),
                          onChanged: (String newValue) {
                            Provider.of<MyModel>(context,listen: false).changeDropDownValue(newValue);
                          },
                          items: <String>['Master Card', 'ABA', 'ACLEDA', 'AMK']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(child: Text(value, textAlign: TextAlign.center)),
                            );
                          }).toList(),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
