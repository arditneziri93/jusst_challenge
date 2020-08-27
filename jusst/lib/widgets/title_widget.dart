import 'package:flutter/material.dart';
import 'package:jusst/blocs/bloc_provider.dart';
import 'package:jusst/blocs/title_bloc.dart';
import 'package:jusst/utils/constants.dart';

class TitleWidget extends StatelessWidget {
  String title = S.titlePlaceholder;
  String artist = S.artistPlaceholder;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TitleBloc>(context);
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          setTitle(snapshot.data.title);
          setArtist(snapshot.data.artist);
        }
        return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  color: C.primaryTextColor,
                ),
              ),
            ),
            Container(
              child: Text(
                artist,
                style: TextStyle(
                  fontSize: 20,
                  color: C.secondaryTextColor,
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  void setTitle(String newTitle) {
    if (newTitle != null) {
      title = newTitle;
    }
  }

  void setArtist(String newArtist) {
    if (newArtist != null) {
      artist = newArtist;
    }
  }
}
