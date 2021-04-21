import 'package:flutter/material.dart';
import 'package:movie/pages/movies/movie_detail.dart';
import 'package:movie/repos/Movie.dart';

class MyModel extends ChangeNotifier{

  changeAdult(Result movie){
    movie.adult = !movie.adult;
    notifyListeners();
  }

  setFavClickedToFalse(){
    favClicked = false;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }

  int clickedCount = 0;
  void changeClicked(Map data){
    data['clicked'] = !data['clicked'];
    clickedCount += 1;
    notifyListeners();
  }

  void addDataQty(discountData){
    discountData['qty'] += 1;
    notifyListeners();
  }

  void subDataQty(discountData){
    discountData['qty'] -= 1;
    notifyListeners();
  }

  void removeProductData(List listProductData, index){
    if(listProductData.length > 0) {
       if (listProductData[index]['qty'] > 0) {
         listProductData[index]['qty'] -= 1;
         totalAmount -= listProductData[index]['unitPrice'];
       }
       if (listProductData[index]['qty'] == 0) {
        listProductData.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearQtyData(){
    for(int i = 0;i<listProductData.length;i++){
      listProductData[i]['qty'] = 0;
    }
    listProductData.clear();
    totalAmount = 0;
    notifyListeners();
  }

  TextEditingController nameController;
  TextEditingController phoneController;
  TextEditingController selectPaymentController;

  void changeDropDownValue(value){
    dropdownValue = value;
    notifyListeners();
  }

  void clearAllText(){
    dropdownValue = null;
    nameController.text = '';
    phoneController.text = '';
    selectPaymentController.text = '';
    notifyListeners();
  }

}

List listProductData = [];

double totalAmount = 0;

String dropdownValue ;


