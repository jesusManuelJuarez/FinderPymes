import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapGoogleCustomerProfileRegister extends StatefulWidget {
  final double latitud;
  final double longitud;
  const MapGoogleCustomerProfileRegister(
      {Key? key, required this.latitud, required this.longitud})
      : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MapGoogleCustomerProfileRegisterState createState() =>
      _MapGoogleCustomerProfileRegisterState();
}

class _MapGoogleCustomerProfileRegisterState
    extends State<MapGoogleCustomerProfileRegister> {
  late GoogleMapController mapController;
  late LatLng _center;
  late Set<Marker> _markers;

  @override
  void initState() {
    _center = LatLng(widget.latitud, widget.longitud);
    _markers = {
      Marker(
        markerId: const MarkerId('marker_1'),
        position: _center,
      ),
    };
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      mapType: MapType.satellite,
      markers: _markers, // Agrega los marcadores al mapa
    );
  }
}

