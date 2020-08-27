import 'package:flutter/material.dart';

//Colors
class C {
  static final ThemeData themeData = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Color(0xff020306),
  );

  static final LinearGradient appBarGradient = LinearGradient(colors: [
    Color(0xff012137),
    Color(0xff023D5B),
    Color(0xff064579),
  ]);

  static final LinearGradient progressBarGradient = LinearGradient(colors: [
    Color(0xff064579).withOpacity(0.3),
    Color(0xff047BDF),
  ]);

  static final Color systemBootingColor = Color(0xffA86B1D);
  static final Color systemUpdatingColor = Color(0xff388095);
  static final Color systemErrorColor = Color(0xff9D2626);

  static final Color iconDisabledColor = Color(0xff3B4860);
  static final Color iconEnabledColor = Color(0xffD9D9DF);

  static final Color primaryTextColor = Color(0xffD9D9DF);
  static final Color secondaryTextColor = Color(0xff64728D);

  static final Color volumeBoxColor = Color(0xff111620).withOpacity(0.8);
}

//Strings
class S {
  static final String appTitle = "Jusst Challenge";
  static final String connectionErrorText = "Connection error";
  static final String systemBootingText = "System booting";
  static final String systemUpdatingText = "System updating";
  static final String systemErrorText = "System error";
  static final String titlePlaceholder = "No Title";
  static final String artistPlaceholder = "No Artist";
}

//Icons
class I {
  static final playbackIcon = AnimatedIcons.pause_play;
  //
  static final IconData bluetoothPairing = Icons.bluetooth_searching;
  static final IconData bluetoothConnected = Icons.bluetooth_connected;
  static final IconData bluetoothInactive = Icons.bluetooth_disabled;
  //
  static final IconData volumeOff = Icons.volume_off;
  static final IconData volumeUp = Icons.volume_up;
  static final IconData volumeDown = Icons.volume_down;
}

//Assets
class A {
  static final AssetImage logo = AssetImage("images/logo.png");
  static final AssetImage coverArtPlaceholder =
      AssetImage("images/coverArtPlaceholder.png");
  static final AssetImage coverArtPlaceholderBlank =
      AssetImage("images/coverArtPlaceholderBlank.png");
}
