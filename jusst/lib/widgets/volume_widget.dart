import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jusst/blocs/bloc_provider.dart';
import 'package:jusst/blocs/volume_bloc.dart';
import 'package:jusst/utils/constants.dart';

class VolumeWidget extends StatefulWidget {
  _VolumeWidgetState createState() => _VolumeWidgetState();
}

class _VolumeWidgetState extends State<VolumeWidget> {
  bool volumeChanged = false;
  IconData volumeIcon = I.volumeOff;
  int volumeValue = 0;
  Timer timer;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<VolumeBloc>(context);
    return StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            setVolume(snapshot.data);
          }
          return Center(
            child: ClipRect(
              child: AnimatedCrossFade(
                crossFadeState: volumeChanged
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 200),
                firstChild: Container(
                  width: 200,
                  height: 200,
                ),
                secondChild: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: C.volumeBoxColor),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Icon(volumeIcon,
                              size: 100, color: C.iconEnabledColor),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            volumeValue.toString(),
                            style: TextStyle(fontSize: 30),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void setVolume(int newVolume) {
    if (newVolume != null && newVolume != volumeValue) {
      volumeChanged = true;
      volumeDelayHide();
      if (newVolume > volumeValue) {
        volumeIcon = I.volumeUp;
      } else {
        volumeIcon = I.volumeDown;
      }
      if (newVolume == 0) {
        volumeIcon = I.volumeOff;
      }
      volumeValue = newVolume;
    }
  }

  void volumeDelayHide() async {
    if (timer != null) {
      timer.cancel();
    }
    timer = new Timer(Duration(seconds: 3), () {
      setState(() {
        volumeChanged = false;
      });
    });
  }
}
