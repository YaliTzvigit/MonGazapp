// Pour commander ta bouteille

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class CommandePage extends StatefulWidget {
  const CommandePage({super.key});

  @override
  _CommandePageState createState() => _CommandePageState();
}

class _CommandePageState extends State<CommandePage> {
  GoogleMapController? _mapController;
  LatLng? _currentPosition;

  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Permission de localisation refusée.")),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _addMarkers();
    });
  }

  void _addMarkers() {
    _markers.add(
      Marker(
        markerId: MarkerId("me"),
        position: _currentPosition!,
        infoWindow: InfoWindow(title: "Vous êtes ici"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );

    // Points de vente fictifs à Abidjan (à adapter)
    _markers.addAll([
      Marker(
        markerId: MarkerId("gaz1"),
        position: LatLng(_currentPosition!.latitude + 0.005,
            _currentPosition!.longitude + 0.002),
        infoWindow: InfoWindow(title: "Point Gaz - Yopougon"),
      ),
      Marker(
        markerId: MarkerId("gaz2"),
        position: LatLng(_currentPosition!.latitude - 0.004,
            _currentPosition!.longitude - 0.003),
        infoWindow: InfoWindow(title: "Point Gaz - Cocody"),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Commander du gaz")),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition!,
                zoom: 14,
              ),
              onMapCreated: (controller) => _mapController = controller,
              myLocationEnabled: true,
              markers: Set<Marker>.of(_markers),
            ),
    );
  }
}
