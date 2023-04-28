import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

/*Future<void> main() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    try {
      final response = request.response;
      response.statusCode = HttpStatus.ok;
      response.headers.contentType = ContentType.json;
      response.write(json.encode({'message': 'Hello World'}));
      print("object to localhost");
      await response.close();
    } catch (e) {
      print('Exception in handling request: $e');
    }
  }
}
*/

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
    return Response.ok("<html><body>ホットリロード対応です！</body></html>",
        headers: {"content-type": "text/html"});
  });
  router.get('/api/users', (Request request) {
    var users = [
      {'id': 1, 'name': 'ユーザーA'},
      {'id': 2, 'name': 'ユーザーB'},
      {'id': 3, 'name': 'ユーザーC'},
    ];
    var json = jsonEncode(users);
    return Response.ok(json, headers: {"content-type": "application/json"});
  });
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
    try {
      final response = request.response;
      response.statusCode = HttpStatus.ok;
      response.headers.contentType = ContentType.json;
      response.write(json.encode({'message': 'Hello World'}));
      print('Exception in handling request:');
      await response.close();
    } catch (e) {
      print('Exception in handling request: $e');
    }
  }
}   
*/