

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Model/all_model.dart';
import '../Repo/all_repo.dart';

class AllProductProvider extends ChangeNotifier{
  List<AllModel> allproduct=[];
  List<int>  favProducts =[];
  List<int>  addtoCarts =[];

  bool isloding = false;
  Future<void> getAllproduct() async {
    isloding = true;
    allproduct=await GetAllProductRepo();
    isloding = false;
    notifyListeners();
  }

  void addValue(int sel_val){
    favProducts.add(sel_val);
    notifyListeners();
  }
  void removeValue(int sel_val){
    favProducts.remove(sel_val);
    notifyListeners();
  }


  void addCartValue(int card_val){
    addtoCarts.add(card_val);
    notifyListeners();
  }
  void removeCartValue(int card_val){
    addtoCarts.remove(card_val);
    notifyListeners();
  }

  cartClear(){
    addtoCarts.clear();
    notifyListeners();
  }

}

class AllElectroniProductProvider extends ChangeNotifier{
  List<AllModel> allproduct=[];
  List<int>  favProducts =[];
  List<int>  addtoCarts =[];

  bool isloding = false;
  Future<void> getAllproduct() async {
    isloding = true;
    allproduct=await GetElectronicProductRepo();
    isloding = false;
    notifyListeners();
  }

  void addValue(int sel_val){
    favProducts.add(sel_val);
    notifyListeners();
  }
  void removeValue(int sel_val){
    favProducts.remove(sel_val);
    notifyListeners();
  }


  void addCartValue(int card_val){
    addtoCarts.add(card_val);
    notifyListeners();
  }
  void removeCartValue(int card_val){
    addtoCarts.remove(card_val);
    notifyListeners();
  }



}