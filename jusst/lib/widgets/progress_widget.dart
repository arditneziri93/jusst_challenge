import 'package:flutter/material.dart';
import 'package:jusst/blocs/bloc_provider.dart';
import 'package:jusst/blocs/progress_bloc.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:jusst/utils/constants.dart';

class ProgressWidget extends StatelessWidget {
  //Variables
  int playbackPosition = 0;
  int duration = 0;
  double progressPercent = 0;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ProgressBloc>(context);
    return StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.metadata != null) {
              setDuration(snapshot.data.metadata.duration);
            }
            setPlaybackPosition(snapshot.data.playbackPosition);
            setProgress(duration, playbackPosition);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Center(
                  child: Text(
                    '${convertInMinutes(playbackPosition)} / ${convertInMinutes(duration)}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                  height: 10,
                  child: duration > 0
                      ? GradientProgressIndicator(
                          gradient: C.progressBarGradient,
                          value: progressPercent,
                        )
                      : GradientProgressIndicator(
                          gradient: C.progressBarGradient,
                        )),
            ],
          );
        });
  }

  void setPlaybackPosition(int newPlaybackPosition) {
    if (newPlaybackPosition != null) {
      playbackPosition = newPlaybackPosition;
    }
  }

  void setDuration(int newDuration) {
    if (newDuration != null) {
      duration = newDuration;
    }
  }

  setProgress(int total, int progress) {
    if (total != null && total != 0 && progress != null && progress != 0) {
      progressPercent = progress / total;
    } else {
      progressPercent = 0;
    }
  }

  String convertInMinutes(int timeAmount) {
    int minutes = timeAmount ~/ 60;
    int seconds = timeAmount % 60;
    String minutesString = minutes.toString().padLeft(2, '0');
    String secondsString = seconds.toString().padLeft(2, '0');
    return "$minutesString:$secondsString";
  }
}
