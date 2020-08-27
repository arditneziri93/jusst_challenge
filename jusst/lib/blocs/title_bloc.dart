import 'dart:async';

import 'package:jusst/blocs/bloc.dart';
import 'package:jusst/models/metadata_model.dart';

class TitleBloc extends Bloc {
  final _streamController = StreamController<MetaDataModel>();

  Sink<MetaDataModel> get sink => _streamController.sink;

  Stream<MetaDataModel> get stream => _streamController.stream;

  @override
  void dispose() => _streamController.close();
}
