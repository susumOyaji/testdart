import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

void main(List<String> arguments) async {
  createServer();
}

Future<HttpServer> createServer() async {
  var server = await shelf_io.serve(createRouter(), 'localhost', 3000);
  server.autoCompress = true;
  print('サーバー起動: http://${server.address.host}:${server.port}');
  return server;
}

Router createRouter() {
  final router = Router();
  router.get('/', (Request request) {
    var users = [
      {'id': 1, 'name': 'ユーザーA'},
      {'id': 2, 'name': 'ユーザーB'},
      {'id': 3, 'name': 'ユーザーC'},
    ];
    var json = jsonEncode(users);
    return Response.ok(
      json, 
      headers: {
        "content-type": "application/json"
        }
      );
    //"<html><body><b>Dart</b>で出力したHTMLです！</body></html>",
    //headers: {"content-type": "text/html"});
  });
  /*
    router.get('/api/users', (Request request) {
    var users = [
      {'id': 1, 'name': 'ユーザーA'},
      {'id': 2, 'name': 'ユーザーB'},
      {'id': 3, 'name': 'ユーザーC'},
    ];
    var json = jsonEncode(users);
    return Response.ok(
      json,
      headers: {
        "content-type" : "application/json"
      }
    );
  });
    */
  return router;
}



 ///  /project/lib/test.dart
//import 'dart:io';
/*
void main() async {
  await httpServer();
}

Future<void> httpServer() async {
  var server = await HttpServer.bind(
    '127.0.0.1',
    3000,
  );
  await for (HttpRequest request in server) {
    request.response
      ..write('Hello!')
      ..close();
  }
}   */