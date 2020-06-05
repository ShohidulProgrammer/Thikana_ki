import 'dart:async';

import 'package:fluster/fluster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geoLoc;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' ;
import 'package:thikana_ki/cores/utils/location/current_location.dart';

import 'marker/map_helper.dart';
import 'marker/map_marker.dart';
import 'marker/marker_location_list.dart';

class MyGoogleMap extends StatefulWidget {
  final double heightPart;
  final bool myLocationEnabled;

  const MyGoogleMap({this.heightPart: 3, this.myLocationEnabled = false});

  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  LocationUtils _locationUtils = LocationUtils();

  // variable for location
  var currentLocation = LocationData;
  var location = new Location();
  CameraPosition _currentPosition;

  // variable for marker
  final Completer<GoogleMapController> _mapController = Completer();
  final Set<Marker> _markers = Set();
  final int _minClusterZoom = 0;
  final int _maxClusterZoom = 19;
  Fluster<MapMarker> _clusterManager;
  double _currentZoom = 15;
  bool _isMapLoading = true;
  bool _areMarkersLoading = true;

  /// Url image used on normal markers
  final String _markerImageUrl =
      'https://img.icons8.com/office/80/000000/marker.png';

  /// Color of the cluster circle
  final Color _clusterColor = Colors.blue;

  /// Color of the cluster text
  final Color _clusterTextColor = Colors.white;

  Future<void> getCurrentLocation() async {
    geoLoc.Position position = await geoLoc.Geolocator()
        .getCurrentPosition(desiredAccuracy: geoLoc.LocationAccuracy.high);
    print('\n\nMy Location: $position');
    // camera position
    setState(() {
      _currentPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: _currentZoom,
      );
    });


  }

  Future _getLocation() async {
    try {
    location.onLocationChanged().listen((LocationData currentLocation) {
        print('Latitude:${currentLocation.latitude}');
        print('Longitude:${currentLocation.longitude}');

        // camera position
        setState(() {
          _currentPosition = CameraPosition(
            target: LatLng(currentLocation.latitude, currentLocation.longitude),
            zoom: _currentZoom,
          );
        });

        return _currentPosition;
      });
    } catch (e) {
      print('ERROR:$e');
      currentLocation = null;
    }
  }

  @override
  void initState() {
    getCurrentLocation();
//    _getLocation();
    _initMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
//    context.size.height ;
    return Container(
      width: double.infinity,
      height: screenHeight / widget.heightPart ?? screenHeight,
//      height: widget.height,
//      padding: EdgeInsets.only(bottom: 10),
      child: _currentPosition == null
          ? Container(
              child: Center(
                child: Text(
                  'loading map..',
                  style: TextStyle(
                      fontFamily: 'Avenir-Medium', color: Colors.blueGrey[300]),
                ),
              ),
            )
          : GoogleMap(
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer())
              ].toSet(),
              initialCameraPosition: _currentPosition,
              myLocationEnabled: widget.myLocationEnabled,
              markers: _markers,
              onMapCreated: (controller) => _onMapCreated(controller),
              onCameraMove: (position) => _updateMarkers(position.zoom),
            ),
    );
  }

  /// Called when the Google Map widget is created. Updates the map loading state
  /// and inits the markers.
  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
    setState(() {
      _isMapLoading = false;
    });
    _initMarkers();
  }

  /// Inits [Fluster] and all the markers with network images and updates the loading state.
  void _initMarkers() async {
    final List<MapMarker> markers = [];

    for (LatLng markerLocation in markerLocations) {
      final BitmapDescriptor markerImage =
          await MapHelper.getMarkerImageFromUrl(_markerImageUrl);

      markers.add(
        MapMarker(
          id: markerLocations.indexOf(markerLocation).toString(),
          position: markerLocation,
          icon: markerImage,
        ),
      );
    }

    _clusterManager = await MapHelper.initClusterManager(
      markers,
      _minClusterZoom,
      _maxClusterZoom,
    );

    await _updateMarkers();
  }

  /// Gets the markers and clusters to be displayed on the map for the current zoom level and
  /// updates state.
  Future<void> _updateMarkers([double updatedZoom]) async {
    if (_clusterManager == null || updatedZoom == _currentZoom) return;

    if (updatedZoom != null) {
      _currentZoom = updatedZoom;
    }

    setState(() {
      _areMarkersLoading = true;
    });

    final updatedMarkers = await MapHelper.getClusterMarkers(
      _clusterManager,
      _currentZoom,
      _clusterColor,
      _clusterTextColor,
      80,
    );

    _markers
      ..clear()
      ..addAll(updatedMarkers);

    setState(() {
      _areMarkersLoading = false;
    });
  }
}
