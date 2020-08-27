import 'dart:async';

import 'package:jusst/blocs/bloc.dart';
import 'package:jusst/models/state_model.dart';

class PlaybackBloc extends Bloc {
  final _streamController = StreamController<PlaybackState>();

  Sink<PlaybackState> get sink => _streamController.sink;

  Stream<PlaybackState> get stream => _streamController.stream;

  @override
  void dispose() => _streamController.close();
}
