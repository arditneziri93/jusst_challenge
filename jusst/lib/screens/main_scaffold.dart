import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jusst/blocs/bloc_provider.dart';
import 'package:jusst/blocs/image_bloc.dart';
import 'package:jusst/blocs/playback_bloc.dart';
import 'package:jusst/blocs/progress_bloc.dart';
import 'package:jusst/blocs/systembar_bloc.dart';
import 'package:jusst/blocs/title_bloc.dart';
import 'package:jusst/blocs/volume_bloc.dart';
import 'package:jusst/models/state_model.dart';
import 'package:jusst/utils/constants.dart';
import 'package:jusst/utils/repository.dart';
import 'package:jusst/widgets/image_widget.dart';
import 'package:jusst/widgets/playback_widget.dart';
import 'package:jusst/widgets/progress_widget.dart';
import 'package:jusst/widgets/systembar_widget.dart';
import 'package:jusst/widgets/title_widget.dart';
import 'package:jusst/widgets/volume_widget.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class MainScaffold extends StatelessWidget {
  final Repository repository = new Repository();
  @override
  Widget build(BuildContext context) {
    SystemBarBloc systemBarBloc = new SystemBarBloc();
    SystemBarWidget systemBarWidget = new SystemBarWidget();

    TitleBloc titleBloc = new TitleBloc();
    TitleWidget titleWidget = new TitleWidget();

    ImageBloc imageBloc = new ImageBloc();
    ImageWidget imageWidget = new ImageWidget();

    VolumeBloc volumeBloc = new VolumeBloc();
    VolumeWidget volumeWidget = new VolumeWidget();

    ProgressBloc progressBloc = new ProgressBloc();
    ProgressWidget progressWidget = new ProgressWidget();

    PlaybackBloc playbackBloc = new PlaybackBloc();
    PlaybackWidget playbackWidget = new PlaybackWidget();

    return Scaffold(
      appBar: gradientAppBar(),
      body: StreamBuilder<Object>(
        stream: repository.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            StateModel newStateModel = snapshot.data;
            systemBarBloc.sink.add(newStateModel);
            titleBloc.sink.add(newStateModel.metadata);
            imageBloc.sink.add(newStateModel.metadata);
            volumeBloc.sink.add(newStateModel.volume);
            progressBloc.sink.add(newStateModel);
            playbackBloc.sink.add(newStateModel.playback);
            return SafeArea(
              child: Column(
                children: [
                  BlocProvider(
                    bloc: systemBarBloc,
                    child: systemBarWidget,
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: BlocProvider(
                      bloc: titleBloc,
                      child: titleWidget,
                    ),
                  ),
                  Flexible(
                    flex: 20,
                    fit: FlexFit.tight,
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        BlocProvider(
                          bloc: imageBloc,
                          child: imageWidget,
                        ),
                        BlocProvider(
                          bloc: volumeBloc,
                          child: volumeWidget,
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: BlocProvider(
                      bloc: progressBloc,
                      child: progressWidget,
                    ),
                  ),
                  Flexible(
                    flex: 7,
                    fit: FlexFit.tight,
                    child: BlocProvider(
                      bloc: playbackBloc,
                      child: playbackWidget,
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Text(S.connectionErrorText),
            );
          }
        },
      ),
    );
  }
}

GradientAppBar gradientAppBar() {
  return GradientAppBar(
    centerTitle: false,
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(image: A.logo),
    ),
    gradient: C.appBarGradient,
  );
}
