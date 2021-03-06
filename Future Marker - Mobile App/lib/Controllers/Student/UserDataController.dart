import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class UserData{

  String URL='http://futuremarker.com/api';
  String imageurl = 'http://futuremarker.com';

  var status ;
  var token ;

  Future getData() async{
    String FullUrl = "$URL/SuserData";
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    http.Response response = await http.get(FullUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });
    print(json.decode(response.body));
    return json.decode(response.body);
  }


  Future shomeData() async{
    String FullUrl = "$URL/ShomeData";
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    http.Response response = await http.get(FullUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });
    print(json.decode(response.body));
    return json.decode(response.body);
  }


}
