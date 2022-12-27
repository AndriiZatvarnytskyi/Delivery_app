import 'package:delivery_app/screens/location/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  String googleApikey = "AIzaSyCUc5V5VxUC2HhpktpoaMP9sI9A275reXY";
  GoogleMapController? mapController;
  String location = "Search Location";
  static const LatLng _center = LatLng(49.349949, 23.505306);
  late LatLng newLatLang;
  final Set<Marker> _markers = {};
  final List<Place> _places = places;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: GoogleMap(
            padding: const EdgeInsets.only(top: 110, right: 10, left: 10),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomGesturesEnabled: true,
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: _center,
              zoom: 13,
            ),
            markers: _markers,
          ),
        ),
        Positioned(
            top: 40,
            child: InkWell(
                onTap: () async {
                  await _searchLocation(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Card(
                    color: Colors.white,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: ListTile(
                          title: Text(
                            location,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          trailing: const Icon(Icons.search),
                          dense: true,
                        )),
                  ),
                ))),
      ],
    );
  }

  Future<void> _searchLocation(BuildContext context) async {
    var place = await PlacesAutocomplete.show(
        context: context,
        apiKey: googleApikey,
        mode: Mode.overlay,
        types: [],
        strictbounds: false,
        onError: (err) {});

    if (place != null) {
      setState(() {
        location = place.description.toString();
      });

      final plist = GoogleMapsPlaces(
        apiKey: googleApikey,
        apiHeaders: await const GoogleApiHeaders().getHeaders(),
      );
      String placeid = place.placeId ?? "0";
      final detail = await plist.getDetailsByPlaceId(placeid);
      final geometry = detail.result.geometry!;
      final lat = geometry.location.lat;
      final lang = geometry.location.lng;
      newLatLang = LatLng(lat, lang);
      _mapPlacesToMarkers();

      mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: newLatLang, zoom: 17)));
    }
  }

  void _upsertMarker(Place place) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(place.id),
        position: newLatLang,
        infoWindow: InfoWindow(
          title: place.name,
          snippet:
              [...place.occasions, ...place.vibes, ...place.budget].join(", "),
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _mapPlacesToMarkers() {
    for (final place in _places) {
      _upsertMarker(place);
    }
  }

  // @override
  // initState() {
  //   super.initState();
  //   _mapPlacesToMarkers();
  // }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });

    rootBundle.loadString('assets/map_style.json').then((mapStyle) {
      mapController?.setMapStyle(mapStyle);
    });
  }
}
