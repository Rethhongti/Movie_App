import 'package:flutter/material.dart';
import 'package:movie/pages/movies/movie_local_widget/build_itemBuilder.dart';


Widget buildListView(result, scrollController){
  return Container(
    color: Colors.black,
    child: RefreshIndicator(
      onRefresh: () async {
      },
      child: ListView.builder(
        controller: scrollController,
        itemCount: result.length,
        itemBuilder: (context, index) => buildItemBuilder(context, result[index]),
      ),
    ),
  );
}