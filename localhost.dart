import 'dart:convert';
import 'dart:io';
//import 'package:shelf/shelf.dart';
//import 'package:shelf/shelf_io.dart' as shelf_io;
//import 'package:shelf_router/shelf_router.dart';

void main() async {
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    request.response.headers.add('Access-Control-Allow-Origin', '*');
    request.response.headers.add('Access-Control-Allow-Methods', 'POST, GET, OPTIONS');
    request.response.headers.add('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    if (request.method == 'GET') {
      handleGetRequest(request);
    } else if (request.method == 'POST') {
      handlePostRequest(request);
    } else {
      request.response
        ..statusCode = HttpStatus.methodNotAllowed
        ..write('Unsupported request: ${request.method}.')
        ..close();
    }
  }
}

void handleGetRequest(HttpRequest request) {
  
  request.response
    ..headers.contentType = ContentType.json
    ..write({'id': 1, 'name': 'ユーザーA'})
    ..close();
    print("GET");
}

void handlePostRequest(HttpRequest request) async {
  final body = await utf8.decoder.bind(request).join();
  print('Received POST request with body: $body');
  request.response
    ..headers.contentType = ContentType.text
    ..write('Thank you for your submission, $body')
    ..close();
}













/*
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
    return Response.ok(router,
      headers: { "content-type": "application/json" }
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

*/

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