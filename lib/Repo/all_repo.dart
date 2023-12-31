import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/all_model.dart';
import '../const.dart';
Future<List<AllModel>> GetAllProductRepo()async{
  List<AllModel> _allModelList=[];
  var response=await http.get(Uri.parse(baseUrl));
  print(response.body);
  print(response.statusCode);
  var data=jsonDecode(response.body);
  if(response.statusCode==200){
    for(var list in data){
      _allModelList.add(AllModel.fromJson(list));
    }
    print("Success");
  }else{
    print("Error");
  }
  return _allModelList;
}

Future<List<AllModel>> GetElectronicProductRepo()async{
  List<AllModel> _allModelList=[];
  var response=await http.get(Uri.parse(electronicUrl));
  print(response.body);
  print(response.statusCode);
  var data=jsonDecode(response.body);
  if(response.statusCode==200){
    for(var list in data){
      _allModelList.add(AllModel.fromJson(list));
    }
    print("Success");
  }else{
    print("Error");
  }
  return _allModelList;
}


class SerachRepo{

  Future<List<AllModel>> searchAllProductRepo()async{
    List<AllModel> _allModelList=[];
    var response=await http.get(Uri.parse(baseUrl));
    print(response.body);
    print(response.statusCode);
    var data=jsonDecode(response.body);
    if(response.statusCode==200){
      for(var list in data){
        _allModelList.add(AllModel.fromJson(list));
      }
      print("Success");
    }else{
      print("Error");
    }
    return _allModelList;
  }

}