import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:thikana_ki/cores/configs/constants/google_map_constant.dart';
import 'package:thikana_ki/cores/utils/location/current_location.dart';

class MyGoogleMap extends StatefulWidget {
  final double heightPart;
  final bool myLocationEnabled;

  const MyGoogleMap({this.heightPart: 3, this.myLocationEnabled = false});

  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  LocationData currentLocation;
  Location location;
  LocationData destinationLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
//    context.size.height ;
    return Container(
      width: double.infinity,
      height: screenHeight/ widget.heightPart ?? screenHeight,
//      height: widget.height,
//      padding: EdgeInsets.only(bottom: 10),
      child: GoogleMap(
        initialCameraPosition: initialCameraPosition,

        myLocationEnabled: widget.myLocationEnabled,
      ),
    );
  }

//
  void updatePinOnMap() async {
    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    CameraPosition cPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
    );
  }

  void setInitialLocation() async {
    // set the initial location by pulling the user's
    // current location from the location's getLocation()
    currentLocation = await location.getLocation();

    // hard-coded destination for this example
    destinationLocation = LocationData.fromMap({
      "latitude": DEST_LOCATION.latitude,
      "longitude": DEST_LOCATION.longitude
    });
  }

//
  void getCurrentLocation() {
    // create an instance of Location
    location = new Location();
    location.onLocationChanged().listen((LocationData cLoc) {
      currentLocation = cLoc;
      updatePinOnMap();
    });
  }
}
