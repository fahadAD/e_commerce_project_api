import 'dart:convert';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:wemax_project/const.dart';
Future<bool> updateProduct({
required File image,
required String title,
required num price,
required String description,
required String category,
required num id,
})async{

  try{
    final String uri="https://fakestoreapi.com/products/$id";
    var request=http.MultipartRequest("PUT",Uri.parse(uri));
    request.fields.addAll({
      "title":title,
      "price":price.toString(),
      "description":description,
      "category":category,
    });
    request.files.add(await http.MultipartFile.fromPath("image", image.path));
    request.headers.addAll({'Accept': 'application/json', 'Authorization': 'Bearer  $bareerToken'});
    var response=await request.send();
    var res=await http.Response.fromStream(response);
    if(response.statusCode==201){
      EasyLoading.showSuccess("Successful Done");
      return true;
    }else{
      var data=jsonDecode(res.body);
      EasyLoading.showSuccess("ID no: $id data update Successful Done");
      print(data['message']);
      return false;
    }
  }catch(e){
    EasyLoading.showError("Error catch = "+e.toString());
    print("catch = "+e.toString());
    throw Exception("Error");
  }

}