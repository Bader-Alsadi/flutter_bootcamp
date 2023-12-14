import 'package:dio/dio.dart';

class ApIHelper{
   static Dio? _conniction;

static Dio dioConnect (){
  if (_conniction==null)
  _conniction= Dio();
  return Dio();
}

}