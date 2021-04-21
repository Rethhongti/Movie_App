import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/MyModel.dart';
import 'package:provider/provider.dart';

Widget buildItemBuilder(context, index) {
  return Card(
    elevation: 5,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      height: 70,
      child: ListTile(
        leading: Container(
          height: 53,
          width: 50,
          child: CachedNetworkImage(
            imageUrl: '${listProductData[index]['imageUrl']}',
            fit: BoxFit.fill,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        title: Text(
          '${listProductData[index]['proName']}',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          '\$${listProductData[index]['unitPrice']}',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        trailing: CircleAvatar(
          backgroundColor: Colors.red,
          radius: 17,
          child: Consumer<MyModel>(builder: (context, myModel, child) {
            return InkWell(
              child: listProductData.length > index
                  ? Text(
                      '${listProductData[index]['qty']}'.padLeft(2, '0'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  : null,
              onTap: () {
                Provider.of<MyModel>(context, listen: false)
                    .removeProductData(listProductData, index);
              },
            );
          }),
        ),
      ),
    ),
  );
}
