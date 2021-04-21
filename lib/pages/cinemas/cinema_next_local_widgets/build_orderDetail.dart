import 'package:flutter/material.dart';

Widget buildOrderDetail(context, subValue){
  return Container(
    margin: EdgeInsets.only(left: 5, right: 5, top: 10),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
    ),
    height: (MediaQuery.of(context).size.height - subValue) * 0.30 ,
    width: MediaQuery.of(context).size.width,
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
  );
}