import 'package:flutter/material.dart';
import 'package:jusst/blocs/bloc_provider.dart';
import 'package:jusst/blocs/playback_bloc.dart';
import 'package:jusst/models/state_model.dart';
import 'package:jusst/utils/constants.dart';

class PlaybackWidget extends StatefulWidget {
  @override
  _PlaybackWidgetState createState() => _PlaybackWidgetState();
}

class _PlaybackWidgetState extends State<PlaybackWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PlaybackBloc>(context);
    return StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            setPlaybackIcon(snapshot.data);
          }
          return AnimatedIcon(
            size: 70,
            color: C.iconEnabledColor,
            icon: AnimatedIcons.pause_play,
            progress: controller,
          );
        });
  }

  void setPlaybackIcon(PlaybackState newPlaybackState) {
    if (newPlaybackState != null) {
      switch (newPlaybackState) {
        case PlaybackState.paused:
          controller.reverse();
          break;
        case PlaybackState.playing:
          controller.forward();
          break;
        default:
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
}
