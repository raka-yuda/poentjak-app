import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../assets/style.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 36.0,
            height: 36.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                fit: BoxFit.cover,
              ),
            ),
          ),
          GpsPill()
        ],
      ),
    );
  }
}

class GpsPill extends StatefulWidget {
  @override
  _GpsPillState createState() => _GpsPillState();
}

class _GpsPillState extends State<GpsPill> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress = "Current Address";

  @override
  Widget build(BuildContext context) {
    return
        // FlatButton(
        //   child: (_currentPosition != null)
        //       ? Text(_currentAddress.split(" ")[1])
        //       : Text("Wait"),
        //   onPressed: () {
        //     _getCurrentLocation();
        //   },
        // ),
        Stack(
      children: <Widget>[
        Container(
          height: 36,
          width: 128,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFFEAE9F3),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.gps_fixed,
                  size: 18,
                ),
                Text(
                  (_currentPosition != null)
                      ? _currentAddress.split(" ")[1]
                      : "Unkown",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        ),
        Positioned.fill(
            child: new Material(
                color: Colors.transparent,
                child: new InkWell(onTap: () {
                  _getCurrentLocation();
                }))),
      ],
    );
    // Text(_currentPosition.toString())
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality.toString()}, ${place.postalCode.toString()}, ${place.country.toString()}";
      });
    } catch (e) {
      print(e);
    }
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Marker> _markers = [];
  final LatLng _currentPosition = LatLng(3.595196, 98.672226);

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: MarkerId("3.595196, 98.672226"),
        position: _currentPosition,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Flutter'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 14.0,
        ),
        markers: _markers.toSet(),
      ),
    );
  }
}
