//import 'dart:async';
//
//import 'package:fluster/fluster.dart';
//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
//import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';
//
//import 'map_helper.dart';
//import 'map_marker.dart';
//import 'marker_location_list.dart';
//
//class GoogleMapPageWithMarker extends StatefulWidget {
//  @override
//  _GoogleMapPageWithMarkerState createState() =>
//      _GoogleMapPageWithMarkerState();
//}
//
//class _GoogleMapPageWithMarkerState extends State<GoogleMapPageWithMarker> {
//  // variable for location
//  var currentLocation = LocationData;
//  var location = new Location();
//  CameraPosition _currentPosition;
//
//  final Completer<GoogleMapController> _mapController = Completer();
//  final Set<Marker> _markers = Set();
//  final int _minClusterZoom = 0;
//  final int _maxClusterZoom = 19;
//  Fluster<MapMarker> _clusterManager;
//  double _currentZoom = 15;
//  bool _isMapLoading = true;
//  bool _areMarkersLoading = true;
//
//  /// Url image used on normal markers
//  final String _markerImageUrl =
//      'https://img.icons8.com/office/80/000000/marker.png';
//
//  /// Color of the cluster circle
//  final Color _clusterColor = Colors.blue;
//
//  /// Color of the cluster text
//  final Color _clusterTextColor = Colors.white;
//
//  /// Called when the Google Map widget is created. Updates the map loading state
//  /// and inits the markers.
//  void _onMapCreated(GoogleMapController controller) {
//    _mapController.complete(controller);
//    setState(() {
//      _isMapLoading = false;
//    });
//    _initMarkers();
//  }
//
//  /// Inits [Fluster] and all the markers with network images and updates the loading state.
//  void _initMarkers() async {
//    final List<MapMarker> markers = [];
//
//    for (LatLng markerLocation in markerLocations) {
//      final BitmapDescriptor markerImage =
//          await MapHelper.getMarkerImageFromUrl(_markerImageUrl);
//
//      markers.add(
//        MapMarker(
//          id: markerLocations.indexOf(markerLocation).toString(),
//          position: markerLocation,
//          icon: markerImage,
//        ),
//      );
//    }
//
//    _clusterManager = await MapHelper.initClusterManager(
//      markers,
//      _minClusterZoom,
//      _maxClusterZoom,
//    );
//
//    await _updateMarkers();
//  }
//
//  /// Gets the markers and clusters to be displayed on the map for the current zoom level and
//  /// updates state.
//  Future<void> _updateMarkers([double updatedZoom]) async {
//    if (_clusterManager == null || updatedZoom == _currentZoom) return;
//
//    if (updatedZoom != null) {
//      _currentZoom = updatedZoom;
//    }
//
//    setState(() {
//      _areMarkersLoading = true;
//    });
//
//    final updatedMarkers = await MapHelper.getClusterMarkers(
//      _clusterManager,
//      _currentZoom,
//      _clusterColor,
//      _clusterTextColor,
//      80,
//    );
//
//    _markers
//      ..clear()
//      ..addAll(updatedMarkers);
//
//    setState(() {
//      _areMarkersLoading = false;
//    });
//  }
//
//  Future _getLocation() async {
//    try {
//      location.onLocationChanged().listen((LocationData currentLocation) {
//        print('Latitude:${currentLocation.latitude}');
//        print('Longitude:${currentLocation.longitude}');
//
//        // camera position
//        setState(() {
//          _currentPosition = CameraPosition(
//            target: LatLng(currentLocation.latitude, currentLocation.longitude),
//            zoom: _currentZoom,
//          );
//        });
//
//        return _currentPosition;
//      });
//    } catch (e) {
//      print('ERROR:$e');
//      currentLocation = null;
//    }
//  }
//
//  @override
//  void initState() {
//    _getLocation();
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: double.infinity,
//      height: UIScreenSize.size.height,
//      child: GoogleMap(
//        mapToolbarEnabled: false,
////        initialCameraPosition: _currentPosition,
//          initialCameraPosition: CameraPosition(
//            target: LatLng(23.8003938, 90.3656941),
//            zoom: _currentZoom,
//          ),
//        markers: _markers,
//        onMapCreated: (controller) => _onMapCreated(controller),
//        onCameraMove: (position) => _updateMarkers(position.zoom),
//      ),
//    );
//
////    return Stack(
////      children: <Widget>[
////        // Google Map widget
////        GoogleMap(
////          mapToolbarEnabled: false,
////          initialCameraPosition: _currentPosition,
//////          initialCameraPosition: CameraPosition(
//////            target: LatLng(41.143029, -8.611274),
//////            zoom: _currentZoom,
//////          ),
////          markers: _markers,
////          onMapCreated: (controller) => _onMapCreated(controller),
////          onCameraMove: (position) => _updateMarkers(position.zoom),
////        ),
////
//////          // Map loading indicator
//////          Opacity(
//////            opacity: _isMapLoading ? 1 : 0,
//////            child: Center(child: CircularProgressIndicator()),
//////          ),
////
//////          // Map markers loading indicator
//////          _areMarkersLoading
//////              ? Padding(
//////                  padding: const EdgeInsets.all(8.0),
//////                  child: Align(
//////                    alignment: Alignment.topCenter,
//////                    child: Card(
//////                      elevation: 2,
//////                      color: Colors.grey.withOpacity(0.9),
//////                      child: Padding(
//////                        padding: const EdgeInsets.all(4),
//////                        child: Text(
//////                          'Loading',
//////                          style: TextStyle(color: Colors.white),
//////                        ),
//////                      ),
//////                    ),
//////                  ),
//////                )
//////              : Container(),
////      ],
////    );
//  }
//}
