import 'dart:async';

import 'package:jusst/blocs/bloc.dart';
import 'package:jusst/models/state_model.dart';

class SystemBarBloc extends Bloc {
  final _streamController = StreamController<StateModel>();

  Sink<StateModel> get sink => _streamController.sink;

  Stream<StateModel> get stream => _streamController.stream;

  @override
  void dispose() => _streamController.close();
}
