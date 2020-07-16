import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class SendData {

  String URL='http://192.168.1.3:8000/api';

  var status ;
  var token ;


  registerData(int role,String name ,String email , String password) async{

    String FullUrl = "$URL/register";
    final response = await  http.post(FullUrl,
        headers: _SetHeader(),
        body: {
          "role":"$role",
          "name": "$name",
          "email": "$email",
          "password" : "$password"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      save(data["token"],data["email"],data["password"]);
    }

  }
  Future<Map> loginData(String email , String password) async{

    String FullUrl = "$URL/login";
    final response = await  http.post(FullUrl,
        headers: _SetHeader(),
        body: {
          "email": "$email",
          "password" : "$password"
        } ) ;
    if(response.statusCode == 200){
      return json.decode(response.body); // token
    } return {'token':0};
//    status = response.body.contains('error');
//
//    var data = json.decode(response.body);
//
//    if(status){
//      print('data : ${data["error"]}');
//    }else{
//      print('data : ${data["token"]}');
//      print('data : ${data["password"]}');
//      _save(data["token"],data["email"],data["password"]);
//
//    }

  }
  _SetHeader() => {

     'Accept':'application/json',

  };

  save(String token,String email,String password) async {
    final prefs = await SharedPreferences.getInstance();
    final Tkey = 'token';
    final value = token;
    final Ekey = 'email';
    final Evalue = email;
    final Pkey = 'password';
    final Pvalue = password;
    prefs.setString(Tkey, value);
    prefs.setString(Ekey, Evalue);
    prefs.setString(Pkey, Pvalue);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }



}