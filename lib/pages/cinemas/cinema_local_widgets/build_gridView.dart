import 'package:flutter/material.dart';
import 'package:movie/pages/cinemas/cinema_local_widgets/build_itemBuilder.dart';

Widget buildGridView(orientation, scrollController, cinemaList){
  return GridView.builder(
    controller: scrollController,
    scrollDirection: Axis.vertical,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.80
    ),
    itemBuilder: (BuildContext context, index) =>
        buildItemBuilder(context, cinemaList[index], index),
    itemCount: cinemaList.length,
  );
}