import 'dart:async';
import 'dart:convert';

import 'package:jusst/models/state_model.dart';
import 'package:jusst/networking/StateApi.dart';

class Repository {
  StateApi _stateApi;
  var _subscription;
  final _streamController = StreamController<StateModel>();

  Sink<StateModel> get sink => _streamController.sink;

  Stream<StateModel> get stream => _streamController.stream;

  Repository() {
    _stateApi = new StateApi();
    _subscription = _stateApi.stream.listen((data) {
      final jsonResponse = json.decode(data);
      StateModel newStateModel = StateModel.fromJson(jsonResponse);
      sink.add(newStateModel);
    });
  }
}
