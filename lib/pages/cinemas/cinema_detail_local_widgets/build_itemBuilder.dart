import 'package:flutter/material.dart';
import 'package:movie/models/MyModel.dart';
import 'package:provider/provider.dart';

Widget buildItemBuilder(data, index, context){
  return InkWell(
    onTap: (){
      Provider.of<MyModel>(context, listen:  false).changeClicked(data);
    },
    child: Consumer<MyModel>(
        builder: (context, myModel, child){
          return Container(
            decoration: BoxDecoration(
              color: data['clicked'] ? Colors.red : Colors.orange,
              borderRadius: BorderRadius.circular(5),
            ),
            child: index < 50 ? Text('S$index', style: TextStyle(
              color: data['clicked'] ? Colors.white : Colors.black,
            ),) : Icon(Icons.spa, size: 22, color: data['clicked'] ? Colors.white : Colors.indigo),
            alignment: Alignment.center,
          );
        }
    ),
  );
}