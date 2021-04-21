import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/MyModel.dart';
import 'package:provider/provider.dart';

Widget buildPopCornBuilder(context, popCornData){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          InkWell(
            onTap: (){
              Provider.of<MyModel>(context, listen: false).addDataQty(popCornData);
            },
            // child: Container(
            //   decoration: BoxDecoration(
            //     color: Colors.red,
            //     // border: Border.all(color: Colors.white, width: 0),
            //     image: DecorationImage(
            //       image: CachedNetworkImageProvider(popCornData['imageUrl']),
            //       fit: BoxFit.cover,
            //     ),
            //     borderRadius: BorderRadius.all(Radius.circular(15)),
            //     // color: Colors.green,
            //   ),
            //   margin: EdgeInsets.only(right: 12),
            //   height: 155,
            //   width: 125,
            // ),
            child: CachedNetworkImage(
              imageUrl: '${popCornData['imageUrl']}',
              imageBuilder: (context, imageProvider) => Container(
                margin: EdgeInsets.only(right: 12),
                height: 155,
                width: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.white,width: 2),
                  color: Colors.red,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.white,width: 2),
                  color: Colors.red,
                ),
                child: Center(child: CircularProgressIndicator()),
                height: 155,
                width: 125,
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.white,width: 2),
                  color: Colors.red,
                ),
                child: Icon(Icons.error),
                height: 155,
                width: 125,
              ),
            ),
          ),
          Positioned(
            top: 3,
            right: 16,
            child: InkWell(
              onTap: (){

                // setState(() {
                //   popCornData['qty'] > 0 ? popCornData['qty'] -= 1 : null;
                // });

                Provider.of<MyModel>(context, listen: false).subDataQty(popCornData);

              },
              child: Consumer<MyModel>(
                  builder: (context, myModel, child){
                    return CircleAvatar(
                      radius: 15,
                      backgroundColor: popCornData['qty'] > 0 ? Colors.red : Colors.transparent,
                      child: popCornData['qty'] > 0 ? Text('${popCornData['qty']}'.padLeft(2, '0')) : SizedBox(),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
      Container(
        width: 125,
        margin: EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(popCornData['proName'], style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
            Text('\t\$${popCornData['unitPrice']}', style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
      ),
    ],
  );
}