import 'dart:async';

import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as area;

import '../../models/model_location.dart';

class LocationUtils {
//  // singleton obj
//  LocationUtils._privateConstructor();
//  static final LocationUtils _instance = LocationUtils._privateConstructor();
//  factory LocationUtils() {
//    return _instance;
//  }

  static LatLng initialPosition;
  static Position position;
  static double lat, long;
  static LocationModel locationModel;

//  static location.LocationData currentLocation;

  var currentLocation = area.LocationData;
  var location = new area.Location();
  CameraPosition currentPosition;

  CameraPosition getLocation()  {
    try {
      location.onLocationChanged().listen((area.LocationData currentLocation) {
//        print('Latitude:${currentLocation.latitude}');
//        print('Longitude:${currentLocation.longitude}');

        // camera position
        currentPosition = CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 14.4746,
        );

        return currentPosition;
      });
    } catch (e) {
      print('ERROR:$e');
    }
    return null;
  }

  static Future<Address> getCurrentLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print(
        ' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    return first;
  }

  Future<List<Placemark>> placeMark() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    print('${placemark[0].name}');
    return placemark;
  }

  static Future<LatLng> getInitialCameraPosition() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return LatLng(position.latitude, position.longitude);
  }
}

//
//import 'package:location/location.dart';
//import 'package:geocoder/geocoder.dart';
//import 'package:flutter/services.dart';
//
//getUserLocation() async {//call this async method from whereever you need
//
//  LocationData myLocation;
//  String error;
//  Location location = new Location();
//  try {
//    myLocation = await location.getLocation();
//  } on PlatformException catch (e) {
//    if (e.code == 'PERMISSION_DENIED') {
//      error = 'please grant permission';
//      print(error);
//    }
//    if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
//      error = 'permission denied- please enable it from app settings';
//      print(error);
//    }
//    myLocation = null;
//  }
//  currentLocation = myLocation;
//  final coordinates = new Coordinates(
//      myLocation.latitude, myLocation.longitude);
//  var addresses = await Geocoder.local.findAddressesFromCoordinates(
//      coordinates);
//  var first = addresses.first;
//  print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
//  return first;
//}

//void updatePinOnMap() async {
//  // create a new CameraPosition instance
//  // every time the location changes, so the camera
//  // follows the pin as it moves with an animation
//  CameraPosition cPosition = CameraPosition(
//    zoom: CAMERA_ZOOM,
//    tilt: CAMERA_TILT,
//    bearing: CAMERA_BEARING,
//    target: LatLng(currentLocation.latitude, currentLocation.longitude),
//  );
//}
//
//void setInitialLocation() async {
//  // set the initial location by pulling the user's
//  // current location from the location's getLocation()
//  currentLocation = await location.getLocation();
//
//  // hard-coded destination for this example
//  destinationLocation = LocationData.fromMap({
//    "latitude": DEST_LOCATION.latitude,
//    "longitude": DEST_LOCATION.longitude
//  });
//}
//
////
//void getCurrentLocation() {
//  // create an instance of Location
//  location = new location.Location();
//  location.onLocationChanged().listen((LocationData cLoc) {
//    currentLocation = cLoc;
//    updatePinOnMap();
//  });
//}
