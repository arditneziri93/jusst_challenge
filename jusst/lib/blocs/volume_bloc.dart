import 'dart:async';

import 'package:jusst/blocs/bloc.dart';

class VolumeBloc extends Bloc {
  final _streamController = StreamController<int>();

  Sink<int> get sink => _streamController.sink;

  Stream<int> get stream => _streamController.stream;

  @override
  void dispose() => _streamController.close();
}
