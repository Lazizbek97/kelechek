import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kelechek/presentation/map/service/location_service.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    required this.location,
  });
  final AppLatLong location;
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  AppLatLong defLocation = const StatesLocation();
  Marker marker = Marker(
    markerId: const MarkerId('1'),
    position: LatLng(
      const StatesLocation().lat,
      const StatesLocation().long,
    ),
    icon: BitmapDescriptor.defaultMarker,
  );
  String currentAddress = '';
  @override
  void initState() {
    currentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: GoogleMap(
              gestureRecognizers: {
                Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer(),
                )
              },
              compassEnabled: false,
              myLocationEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(defLocation.lat, defLocation.long),
                zoom: 20,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                setState(() {});
                // _controller.complete(controller);
              },
              markers: {marker},
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8),
          //   child: SizedBox(
          //     width: double.infinity,
          //     child: Text(
          //       currentAddress,
          //       textAlign: TextAlign.center,
          //       maxLines: 1,
          //       overflow: TextOverflow.ellipsis,
          //       style: TextStyle(
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  currentLocation() async {
    defLocation =
        AppLatLong(lat: widget.location.lat, long: widget.location.long);
    // currentAddress = await LocationService().getCurrentPlace(defLocation);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(defLocation.lat, defLocation.long),
          zoom: 13,
        ),
      ),
    );
    marker = Marker(
      markerId: const MarkerId('1'),
      position: LatLng(
        defLocation.lat,
        defLocation.long,
      ),
      icon: BitmapDescriptor.defaultMarker,
    );
    setState(() {});
  }
}
