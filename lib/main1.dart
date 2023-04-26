import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

//import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;







// main関数。非同期処理(await)を使用するのでasync。
void main() async {
   var _data;
   bool _isLoading = false;
  String _message = '';

   List<List<dynamic>> data = [
    ["6758", 200, 1665],
    ["6976", 300, 1801],
    ["3436", 0, 0],
  ];

   const url = 'http://localhost:3000'; //←ここに表示させたいURLを入力する

    try {
      final response = await http.get(Uri.parse(url).replace(queryParameters: {
        'data': jsonEncode(data),
      }));
      //setState(() {
        _isLoading = true;
        _message = 'Loading data...';
      //});
      return json.decode(response.body);
    } catch (e) {
      //setState(() {
        _isLoading = false;
        _message = 'Failed to load data.';
      //});
    }

  // 取得先のURLを元にして、Uriオブジェクトを生成する。
  //final url = 'http://localhost:3000';
  //final target = Uri.parse(url);

  // 取得する。
  //final response = await http.get(target);

  // 下の行のコメントを外すことで、返されたHTMLを出力できる。
  // print(response.body);

  // ステータスコードをチェックする。「200 OK」以外のときはその旨を表示して終了する。
  //if (response.statusCode != 200) {
  //  print('ERROR: ${response.statusCode}');
    return;
  

  // 取得したHTMLのボディをパースする。
  //final document = parse(response.body);

  // 要素を絞り込んで、結果を文字列のリストで得る。
  //final result = document.querySelectorAll('h2').map((v) => v.text).toList();

  // 結果を出力する。
  //print(result);
}


