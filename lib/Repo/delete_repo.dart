import 'dart:convert';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
Future<bool> updateProduct({required num id,})async{

  try{
    final String uri="https://fakestoreapi.com/products/$id";
    var request=http.MultipartRequest("DELETE",Uri.parse(uri));
    request.headers.addAll({'Accept': 'application/json', 'Authorization': 'Bearer  $bareerToken'});
    var response=await request.send();
    var res=await http.Response.fromStream(response);
    if(response.statusCode==201){
      EasyLoading.showSuccess("Successful Done");
      return true;
    }else{
      var data=jsonDecode(res.body);
      EasyLoading.showSuccess("ID no: $id data delete Successful Done");
      print(data['message']);
      return false;
    }
  }catch(e){
    EasyLoading.showError("Error catch = "+e.toString());
    print("catch = "+e.toString());
    throw Exception("Error");
  }


}