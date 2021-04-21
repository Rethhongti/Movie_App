import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/MyModel.dart';
import 'package:movie/models/Product.dart';
import 'package:movie/pages/food_and_drink/food_and_drink_local_widgets/build_discountBuilder.dart';
import 'package:movie/pages/food_and_drink/food_and_drink_local_widgets/build_iceCreamBuilder.dart';
import 'package:movie/pages/food_and_drink/food_and_drink_local_widgets/build_popCornBuilder.dart';
import 'package:movie/pages/food_and_drink/product_detail.dart';
import 'package:movie/pages/multi_pages/multi_pages.dart';
import 'package:provider/provider.dart';

final foodAndDrinkKey = GlobalKey<_FoodAndDrinkState>();

class FoodAndDrink extends StatefulWidget {
  final Key key = foodAndDrinkKey;
  @override
  _FoodAndDrinkState createState() => _FoodAndDrinkState();
}

class _FoodAndDrinkState extends State<FoodAndDrink> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: Scaffold(
        body: _buildBody,
      ),
    );
  }

  get _buildBody{
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      color: Colors.black,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30),
            alignment: Alignment.centerLeft,
            height: 45,
            width: double.infinity,
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'F & D',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: InkWell(
                    child: Icon(Icons.add_shopping_cart, color: Colors.white),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail()));
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height - kBottomNavigationBarHeight - multiPagesKey.currentState.subHeight() - 45),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Container(
                    height:270,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Discount 10%', style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 19
                        ),),
                        SizedBox(height: 16),
                        Container(
                          height: 230,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: discountData.length,
                            itemBuilder: (context, index) => buildDiscountBuilder(context, discountData[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 224,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ice Cream', style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 19
                        ),),
                        SizedBox(height: 16),
                        Container(
                          height: 180,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: discountData.length,
                            itemBuilder: (context, index) => buildIceCreamBuilder(context, iceCreamData[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 224,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pop Corns', style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 19
                        ),),
                        SizedBox(height: 16),
                        Container(
                          height: 180,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: discountData.length,
                            itemBuilder: (context, index) => buildPopCornBuilder(context, popCornData[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 224,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Drinks', style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 19
                        ),),
                        SizedBox(height: 15),
                        Container(
                          height: 180,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: discountData.length,
                            itemBuilder: (context, index) => _buildDrinkBuilder(drinkData[index], index, context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildDrinkBuilder(drinkData, index, BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            InkWell(
              onTap: (){

                // setState(() {
                //   drinkData['qty'] += 1;
                // });

                Provider.of<MyModel>(context, listen: false).addDataQty(drinkData);

              },
              // child: Container(
              //   decoration: BoxDecoration(
              //     color: Colors.red,
              //     image: DecorationImage(
              //       image: CachedNetworkImageProvider(drinkData['imageUrl']),
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
                imageUrl: '${drinkData['imageUrl']}',
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
                  //   drinkData['qty'] > 0 ? drinkData['qty'] -= 1 : null;
                  // });

                  Provider.of<MyModel>(context, listen: false).subDataQty(drinkData);

                },
                child: Consumer<MyModel>(
                  builder: (context, myModel, child){
                    return CircleAvatar(
                      radius: 15,
                      backgroundColor: drinkData['qty'] > 0 ? Colors.red : Colors.transparent,
                      child: drinkData['qty'] > 0 ? Text('${drinkData['qty']}'.padLeft(2, '0')) : SizedBox(),
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
              Text(drinkData['proName'], style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              Text('\t\$${drinkData['unitPrice']}', style: TextStyle(
              color: Colors.red,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        ),
      ],
    );
  }
}
