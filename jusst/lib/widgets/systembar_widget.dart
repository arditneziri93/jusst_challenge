import 'package:flutter/material.dart';
import 'package:jusst/blocs/bloc_provider.dart';
import 'package:jusst/blocs/systembar_bloc.dart';
import 'package:jusst/models/state_model.dart';
import 'package:jusst/utils/constants.dart';

class SystemBarWidget extends StatelessWidget {
  //
  SystemState systemState = SystemState.updating;
  BluetoothState bluetoothState = BluetoothState.inactive;

  Color systemColor = Colors.transparent;
  String systemText = "";

  IconData bluetoothIcon = I.bluetoothInactive;
  Color bluetoothColor = C.iconDisabledColor;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SystemBarBloc>(context);
    return StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            setSystemState(snapshot.data.system);
            setBluetoothIcon(snapshot.data.bluetooth);
          }
          return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
            color: systemColor,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${systemText}'),
                    Icon(
                      bluetoothIcon,
                      color: bluetoothColor,
                    ),
                  ]),
            ),
          );
        });
  }

  void setSystemState(SystemState newSystemState) {
    if (newSystemState != null) {
      systemState = newSystemState;
      switch (systemState) {
        case SystemState.booting:
          systemColor = C.systemBootingColor;
          systemText = S.systemBootingText;
          break;
        case SystemState.updating:
          systemColor = C.systemUpdatingColor;
          systemText = S.systemUpdatingText;
          break;
        case SystemState.error:
          systemColor = C.systemErrorColor;
          systemText = S.systemErrorText;
          break;
        default:
          systemColor = Colors.transparent;
          systemText = "";
          break;
      }
    }
  }

  void setBluetoothIcon(BluetoothState newBluetoothState) {
    if (newBluetoothState != null) {
      bluetoothState = newBluetoothState;
      switch (bluetoothState) {
        case BluetoothState.pairing:
          bluetoothIcon = I.bluetoothPairing;
          bluetoothColor = C.iconEnabledColor;
          break;
        case BluetoothState.connected:
          bluetoothIcon = I.bluetoothConnected;
          bluetoothColor = C.iconEnabledColor;
          break;
        default:
          bluetoothIcon = I.bluetoothInactive;
          bluetoothColor = C.iconDisabledColor;
          break;
      }
    }
  }
}
