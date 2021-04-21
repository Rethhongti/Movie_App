import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie/models/MyModel.dart';
import 'package:provider/provider.dart';

Widget buildPaymentMethod(){

  var _numberFormat = NumberFormat("#,##0.00", "en_US");

  return Container(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    height: 200,
    child: Consumer<MyModel>(
        builder: (context, myModel, child){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Payment Method', style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Amount', style: TextStyle(
                      color: Colors.white,
                    ),),
                    Consumer<MyModel>(
                        builder : (context, myModel, child){
                          return Text('\$${_numberFormat.format(totalAmount)}', style: TextStyle(
                            color: Colors.white,
                          ),);
                        }
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax fee', style: TextStyle(
                      color: Colors.white,
                    ),),
                    Text('\$0.0', style: TextStyle(
                      color: Colors.white,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery fee', style: TextStyle(
                      color: Colors.white,
                    ),),
                    Text('\$0.0', style: TextStyle(
                        color: Colors.white
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total purchase', style: TextStyle(
                      color: Colors.white,
                    ),),
                    Text('${listProductData.length}', style: TextStyle(
                      color: Colors.white,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Divider(
                thickness: 1,
                color: Colors.white,
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total amount', style: TextStyle(
                      color: Colors.white,
                    ),),
                    Text('\$${_numberFormat.format(totalAmount)}', style: TextStyle(
                      color: Colors.white,
                    ),),
                  ],
                ),
              ),
            ],
          );
        }
    ),
  );
}