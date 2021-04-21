import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/MyModel.dart';
import 'package:provider/provider.dart';

Widget buildDiscountBuilder(context, discountData){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          InkWell(
            onTap: (){
              Provider.of<MyModel>(context, listen: false).addDataQty(discountData);
            },
            child: Container(
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.white,width: 2),
              //   color: Colors.red,
              //   image: DecorationImage(
              //     image: CachedNetworkImageProvider(discountData['imageUrl']),
              //     fit: BoxFit.cover,
              //   ),
              //   borderRadius: BorderRadius.all(Radius.circular(15)),
              // ),
              child: CachedNetworkImage(
                imageUrl: '${discountData['imageUrl']}',
                imageBuilder: (context, imageProvider) => Container(
                  margin: EdgeInsets.only(right: 12),
                  height: 200,
                  width: 145,
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
                  height: 200,
                  width: 145,
                ),
                errorWidget: (context, url, error) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Colors.white,width: 2),
                    color: Colors.red,
                  ),
                  child: Icon(Icons.error),
                  height: 200,
                  width: 145,
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 17,
            child: InkWell(
              onTap: (){
                Provider.of<MyModel>(context, listen: false).subDataQty(discountData);
              },
              child: Consumer<MyModel>(
                  builder: (context, myModel, child){
                    return CircleAvatar(
                      radius: 15,
                      backgroundColor: discountData['qty'] > 0 ? Colors.red : Colors.transparent,
                      child: discountData['qty'] > 0 ? Text('${discountData['qty']}'.padLeft(2, '0')) : SizedBox(),
                    );
                  }
              ),
            ),
          )
        ],
      ),
      SizedBox(height: 5),
      Container(
        width: 140,
        margin: EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(discountData['proName'], style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
            Text('\t\$${discountData['unitPrice']}', style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
      ),
    ],
  );
}