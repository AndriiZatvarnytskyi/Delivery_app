import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class Gmap extends StatefulWidget {
  @override
  State<Gmap> createState() => _GmapState();
}

class _GmapState extends State<Gmap> {
  GoogleMapController? mapController;
  LatLng startLocation = LatLng(27.6602292, 85.308027);

  @override
  Widget build(BuildContext context) {
    // return GoogleMap(
    //     myLocationEnabled: true,
    //     zoomGesturesEnabled: true,
    //     onMapCreated: (controller) {
    //       //method called when map is created
    //       setState(() {
    //         mapController = controller;
    //       });
    //     },
    //     initialCameraPosition: CameraPosition(target: startLocation, zoom: 14));
    return GoogleMap(
      myLocationEnabled: true,
      zoomGesturesEnabled: true,
      mapType: MapType.normal,
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
        });
      },
      initialCameraPosition: CameraPosition(
        //innital position in map
        target: startLocation,
        zoom: 14.0,
      ),
    );
  }
}
