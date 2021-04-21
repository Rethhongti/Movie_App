import 'package:flutter/material.dart';
import 'package:movie/pages/cinemas/cinema_detail_local_widgets/build_itemBuilder.dart';

Widget buildGridView(seatData){
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 10,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      //childAspectRatio: 1
    ),
    itemBuilder: (BuildContext context, index) =>
        buildItemBuilder(seatData[index], index, context),
    itemCount: seatData.length,
  );
}