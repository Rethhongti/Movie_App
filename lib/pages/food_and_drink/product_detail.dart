import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie/models/MyModel.dart';
import 'package:movie/models/Product.dart';
import 'package:movie/pages/food_and_drink/food_and_drink.dart';
import 'package:movie/pages/food_and_drink/product_detail_local_widgets/build_itemBuilder.dart';
import 'package:movie/pages/food_and_drink/product_detail_local_widgets/build_paymentMethod.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {

  final String categoryNumber;
  final int index;
  ProductDetail({this.categoryNumber, this.index});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  List _allData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addProductData();
    addDataTogether();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: OrientationBuilder(
          builder: (context, orientation){
            return orientation == Orientation.portrait ? _buildBody : _buildLandScapeBody;
          }
        ),
      ),
    );
  }

  get _buildBody{
    double subHeight = MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom + 45 + 200 + 10 + 50;
    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                margin: EdgeInsets.only(bottom: 10),
                height: 45,
                width: double.infinity,
                child: Text('Your Order Details', style: TextStyle(
                  color: Colors.red,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: MediaQuery.of(context).size.height - subHeight,
                width: double.infinity,
                child: Consumer<MyModel>(
                    builder: (context, myModel, child){
                      return ListView.builder(
                        itemBuilder: (context, index){
                          return buildItemBuilder(context, index);
                        },
                        itemCount: listProductData.length,
                      );
                    }
                ),
              ),
              buildPaymentMethod(),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: IconButton(
                        icon: Icon(Icons.chevron_left_outlined),
                        color: Colors.red,
                        onPressed: (){
                          foodAndDrinkKey.currentState.setState(() {});
                          Navigator.pop(context);
                        },
                        iconSize: 40,
                      ),
                    ),
                    Container(
                      height: 43,
                      width: MediaQuery.of(context).size.width - 50 - 20 - 10,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.red,
                        onPressed: (){
                          return showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('បញ្ចាក់', style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'KhmerOSbattambang',
                                      fontSize: 16
                                  ),),
                                  content: Container(
                                    child: Text('ការទូទាត់ទទួលបានជោកជ័យ\nសូមអរគុណ!!!', style: TextStyle(
                                      fontFamily: 'KhmerOSbattambang',
                                    ),),
                                  ),
                                  actions: [
                                    RaisedButton(
                                      onPressed: (){
                                        setState(() {
                                          clearQtyData();
                                        });
                                        foodAndDrinkKey.currentState.setState(() {});
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('        បន្ត        ', style: TextStyle(
                                        fontFamily: 'KhmerOSbattambang',
                                      ),),
                                      color: Colors.red,
                                    ),
                                  ],
                                );
                              }
                          );
                        },
                        child: Text('BUY NOW', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  get _buildLandScapeBody{
    var numberFormat = NumberFormat("#,##0.00", "en_US");
    return Container(
      // color: Colors.blue,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color: Colors.blue,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 45,
                width: double.infinity,
                child: Text('Your Order Details', style: TextStyle(
                  color: Colors.red,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 250,
                width: double.infinity,
                child: Consumer<MyModel>(
                  builder: (context, myModel, child){
                    return ListView.builder(
                      itemBuilder: (context, index){
                        print('a');
                        return _buildItemBuilder(context, index);
                      },
                      itemCount: listProductData.length,
                    );
                  }
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 200,
                child: Column(
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
                          Text('\$${numberFormat.format(totalAmount)}', style: TextStyle(
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
                          Text('\$${numberFormat.format(totalAmount)}', style: TextStyle(
                            color: Colors.white,
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      child: IconButton(
                        icon: Icon(Icons.chevron_left_outlined),
                        color: Colors.red,
                        onPressed: (){
                          foodAndDrinkKey.currentState.setState(() {});
                          Navigator.pop(context);
                        },
                        iconSize: 40,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      height: 43,
                      width: MediaQuery.of(context).size.width - 50  - MediaQuery.of(context).padding.left - MediaQuery.of(context).padding.right,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.red,
                        onPressed: (){
                          return showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('បញ្ចាក់', style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'KhmerOSbattambang',
                                      fontSize: 16
                                  ),),
                                  content: Container(
                                    child: Text('ការទូទាត់ទទួលបានជោកជ័យ\nសូមអរគុណ!!!', style: TextStyle(
                                      fontFamily: 'KhmerOSbattambang',
                                    ),),
                                  ),
                                  actions: [
                                    RaisedButton(
                                      onPressed: (){
                                        // setState(() {
                                        //   clearQtyData();
                                        // });

                                        Provider.of<MyModel>(context,listen: false).clearQtyData();

                                        foodAndDrinkKey.currentState.setState(() {});
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('        បន្ត        ', style: TextStyle(
                                        fontFamily: 'KhmerOSbattambang',
                                      ),),
                                      color: Colors.red,
                                    ),
                                  ],
                                );
                              }
                          );
                        },
                        child: Text('BUY NOW', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addProductData(){
    for(int i = 0;i<discountData.length;i++){
      if(discountData[i]['qty'] > 0) {
        listProductData.add(discountData[i]);
        totalAmount += discountData[i]['qty'] * discountData[i]['unitPrice'];
      }
    }
    for(int i = 0;i<iceCreamData.length;i++){
      if(iceCreamData[i]['qty'] > 0) {
        listProductData.add(iceCreamData[i]);
        totalAmount += iceCreamData[i]['qty'] * iceCreamData[i]['unitPrice'];
      }
    }
    for(int i = 0;i<popCornData.length;i++){
      if(popCornData[i]['qty'] > 0) {
        listProductData.add(popCornData[i]);
        totalAmount += popCornData[i]['qty'] * popCornData[i]['unitPrice'];
      }
    }
    for(int i = 0;i<drinkData.length;i++){
      if(drinkData[i]['qty'] > 0) {
        listProductData.add(drinkData[i]);
        totalAmount += drinkData[i]['qty'] * drinkData[i]['unitPrice'];
      }
    }
  }

  void  addDataTogether(){
    _allData = iceCreamData + popCornData + drinkData + discountData;
  }

  int getQtyOfProduct(id){
    for(int i = 0;i<_allData.length;i++){
      if(_allData[i]['id'] == id)
        return _allData[i]['qty'];
    }
  }

  Widget _buildItemBuilder(BuildContext context, index){
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
          title: Text('${listProductData[index]['proName']}', style: TextStyle(
            color: Colors.black,
          ),),
          subtitle: Text('\$${listProductData[index]['unitPrice']}', style: TextStyle(
            color: Colors.red,
          ),),
          trailing: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 17,
                child: Consumer<MyModel>(
                  builder: (context, myModel, child){
                    return InkWell(
                      child: listProductData.length > index ? Text('${listProductData[index]['qty']}'.padLeft(2, '0'), style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),) : null,
                      onTap: (){
                        Provider.of<MyModel>(context, listen: false).removeProductData(listProductData, index);
                      },
                    );
                  }
                ),
              ),
        ),
      ),
    );
  }

  void clearQtyData(){
    for(int i = 0;i<listProductData.length;i++){
      listProductData[i]['qty'] = 0;
    }
    listProductData.clear();
    totalAmount = 0;
  }

}
