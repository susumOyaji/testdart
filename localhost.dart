import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main() async {
  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(_echoRequest);

  var server = await shelf_io.serve(handler, 'localhost', 3000);

  // Enable content compression
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');

 
}

//Response.okでクライアントに対して成功ステータス200を返し、
//引数の文字列を返します。 
Response _echoRequest(Request request) =>
    Response.ok('Request for "${request.url}"');
    





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