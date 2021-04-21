import 'package:flutter/material.dart';
import 'package:movie/models/MyModel.dart';
import 'package:provider/provider.dart';

Widget seatInfo(context, seatData){
  return Container(
    height: 65,
    // color: Colors.red,
    padding: EdgeInsets.only(top: 10, left: 10),
    child: Consumer<MyModel>(
        builder: (context, myModel, child){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.red,
                height: 20,
                child: Text('Seat(s) selected : ${myModel.clickedCount}', style: TextStyle(
                    color: Colors.white
                ),),
              ),
              Container(
                // color: Colors.blue,
                height: 20,
                child: Text('Available seat to be selected : ${seatData.length - myModel.clickedCount}/${seatData.length}', style: TextStyle(
                  color: Colors.white,
                )),
              ),
            ],
          );
        }
    ),
  );

}