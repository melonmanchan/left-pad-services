import 'dart:io';
import 'dart:convert' show JSON;

main() {
    int port = 3000;

    HttpServer.bind('localhost', port).then((HttpServer server) {
        print('Server started on port: $port');
        server.listen((HttpRequest request) {
                String str = request.uri.queryParameters['str'] ?? '';
                String ch = request.uri.queryParameters['ch'] ?? ' ';
                String len = request.uri.queryParameters['len'] ?? '0';

                Map output = {'str': str.padLeft(int.parse(len), ch)};

                request.response..headers.set(HttpHeaders.CONTENT_TYPE, 'application/json');
                request.response..headers.set('Access-Control-Allow-Origin','*');
                request.response..write(JSON.encode(output))..close();
            });
        });
}

