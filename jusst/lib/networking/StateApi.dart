import 'package:web_socket_channel/io.dart';

class StateApi {
  final String _URL = "ws://0.0.0.0:8808/ws";
  var _channel;

  StateApi() {
    _channel = IOWebSocketChannel.connect(_URL);
  }

  Stream<dynamic> get stream {
    return _channel.stream;
  }
}
