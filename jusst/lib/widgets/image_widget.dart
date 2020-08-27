import 'package:flutter/material.dart';
import 'package:jusst/blocs/bloc_provider.dart';
import 'package:jusst/blocs/image_bloc.dart';
import 'package:jusst/utils/constants.dart';

class ImageWidget extends StatelessWidget {
  dynamic coverArtImage = A.coverArtPlaceholder;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ImageBloc>(context);
    return StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            setCoverArtPicture(snapshot.data.coverArt);
          }
          return Container(
            child: Center(
              child: FadeInImage(
                placeholder: A.coverArtPlaceholderBlank,
                image: coverArtImage,
              ),
            ),
          );
        });
  }

  void setCoverArtPicture(String coverArtURL) {
    if (coverArtURL != null) {
      coverArtImage = NetworkImage(coverArtURL);
    }
  }
}
