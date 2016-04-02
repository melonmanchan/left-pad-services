import 'dart:io';
import 'dart:convert' show JSON;

main() {
    var port = 3000;

    HttpServer.bind('localhost', port).then((HttpServer server) {
        print('Server started on port: ${port}');
        server.listen((HttpRequest request) {
                var str = request.uri.queryParameters['str'] ?? '';
                var ch = request.uri.queryParameters['ch'] ?? ' ';
                var len = request.uri.queryParameters['len'] ?? 0;

                print(ch);
                var output = {'str': str};
                request.response..headers.set(HttpHeaders.CONTENT_TYPE, 'application/json');
                request.response..headers.set('Access-Control-Allow-Origin','*');
                request.response..write(JSON.encode(output))..close();
            });
        });
}

