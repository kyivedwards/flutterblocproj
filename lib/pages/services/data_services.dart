import 'dart:convert';

import 'package:flutterblocproj/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  getInfo() async{
    //api
    var apiUrl = '/getplaces'; 
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){
        List<dynamic> list = json.decode(res.body);
        print(list);
        //convert json to map to seperate unique information (block by block)
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return<DataModel>[];
      }
    }catch(e){
      print(e);
      return<DataModel>[];
    }
  }
}