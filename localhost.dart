import 'dart:convert';
//import 'dart:io';
//import 'package:shelf/shelf.dart';
//import 'package:shelf/shelf_io.dart' as shelf_io;
//import 'package:shelf_cors/shelf_cors.dart';
//import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_cors_headers/shelf_cors_headers.dart';



/*
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
*/










void main() async {
  var handler = const shelf.Pipeline()
      // Just add corsHeaders() middleware.
      .addMiddleware(corsHeaders())
      .addHandler(_requestHandler);

  await serve(handler, 'localhost', 3000);
  //shelf.server(handler, 'localhost', 3000).then((server) {
  //print('Serving at http://${server.address.host}:${server.port}');
//});

}

Response _requestHandler(Request request) {
  // Handle GET request.
    var data = {'message': 'Hello, world!'};
    var body = jsonEncode(data);
    return Response.ok(body);
  //print('Serving at http://${request.url}');
  //return Response.ok('Request for "${request.url}"');
}





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
/*
>>>>>>> 08e18759b5b35fceb344fdf6c4fb78db22df4fa8
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
*/
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