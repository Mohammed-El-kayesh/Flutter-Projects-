import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
// @dart=2.9

class DioHelper
{
   static Dio ?dio;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl:'https://newsapi.org/' ,
        receiveDataWhenStatusError: true,
      ),
    );
  }
 static Future<Response> getData({
  required String url,
    required Map<String,dynamic> query,

  })async
  {
    return await dio!.get(url,queryParameters:query, );
  }
}

//https://newsapi.org/
// v2/top-headlines?
// sources=bbc-news&apiKey=db5da08c3e4e455c9d5ae46570b67dcd


// https://newsapi.org/
// v2/top-headlines?
// q=trump&apiKey=db5da08c3e4e455c9d5ae46570b67dcd

//https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=db5da08c3e4e455c9d5ae46570b67dcd


// https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=db5da08c3e4e455c9d5ae46570b67/dcd

//search
// https://newsapi.org/v2/everything?q=bitcoin&apiKey=db5da08c3e4e455c9d5ae46570b67dcd
