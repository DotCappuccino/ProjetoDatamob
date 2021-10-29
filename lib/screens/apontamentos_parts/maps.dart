import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Maps extends StatefulWidget {
  static String routeName = "/Maps";
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    return FloatingActionButton(
        child: Icon(Icons.map_outlined),
        onPressed: () async {
          Location location = new Location();

          _serviceEnabled = await location.serviceEnabled();
          if (!_serviceEnabled) {
            _serviceEnabled = await location.requestService();
            if (!_serviceEnabled) {
              return;
            }
          }

          _permissionGranted = await location.hasPermission();
          if (_permissionGranted == PermissionStatus.denied) {
            _permissionGranted = await location.requestPermission();
            if (_permissionGranted != PermissionStatus.granted) {
              return;
            }
          }

          _locationData = await location.getLocation();

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Posição salva com exito!!\nPosição Atual: ' +
                    _locationData.toString()),
              );
            },
          );
        }
        // _determinePosition();

        );
  }
}
