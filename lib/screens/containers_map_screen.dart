import 'dart:async';

import 'package:digital_tat_hack/locations_services.dart';
import 'package:digital_tat_hack/screens/containers_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContainerMapScreen extends StatefulWidget {
  @override
  State<ContainerMapScreen> createState() => ContainerMapScreenState();
}

class ContainerMapScreenState extends State<ContainerMapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();

  Marker _gaf29BMarker(BuildContext context) {
    return Marker(
      markerId: MarkerId(
        'Gaf29B',
      ),
      infoWindow: InfoWindow(
        title: 'Гафиатуллина 29Б',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(54.905891, 52.270927),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContainerInfoScreen(
              containerAddress: 'Гафиатуллина 29Б',
              image: 'assets/images/Gaf29B.jpg',
              forecast: 36,
              nowContainers: 2,
              maxContainers: 2,
              event: 'Контейнеры за пределами',
            ),
          ),
        );
      },
    );
  }

  Marker _gaf39Marker(BuildContext context) {
    return Marker(
      markerId: MarkerId(
        'Gaf39',
      ),
      infoWindow: InfoWindow(
        title: 'Гафиатуллина 39',
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(54.906383, 52.266427),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContainerInfoScreen(
              containerAddress: 'Гафиатуллина 39',
              image: 'assets/images/Gaf39.jpg',
              forecast: 7,
              nowContainers: 3,
              maxContainers: 4,
              event: 'Недостаточно контейнеров. Контейнеры за пределами',
            ),
          ),
        );
      },
    );
  }

  Marker _gaf45Marker(BuildContext context) {
    return Marker(
      markerId: MarkerId(
        'Gaf45',
      ),
      infoWindow: InfoWindow(
        title: 'Гафиатуллина 45',
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(54.905829, 52.264387),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContainerInfoScreen(
              containerAddress: 'Гафиатуллина 45',
              image: 'assets/images/Gaf45.jpg',
              forecast: 6,
              nowContainers: 3,
              maxContainers: 4,
              event: 'Недостаточно контейнеров',
            ),
          ),
        );
      },
    );
  }

  Marker _gaf47Marker(BuildContext context) {
    return Marker(
      markerId: MarkerId(
        'Gaf47',
      ),
      infoWindow: InfoWindow(
        title: 'Гафиатуллина 47',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      position: LatLng(54.906518, 52.263822),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContainerInfoScreen(
              containerAddress: 'Гафиатуллина 47',
              image: 'assets/images/Gaf47.png',
              forecast: 8,
              nowContainers: 2,
              maxContainers: 2,
              event: '',
            ),
          ),
        );
      },
    );
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Мусорные баки'),
        backgroundColor: Color(0xFF417DA9),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _searchController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: 'Поиск города',
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              IconButton(
                onPressed: () async {
                  var place =
                      await LocationService().getPlace(_searchController.text);
                  _goToPlace(place);
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng(54.905891, 52.270927),
                zoom: 16,
              ),
              markers: {
                _gaf29BMarker(context),
                _gaf39Marker(context),
                _gaf45Marker(context),
                _gaf47Marker(context),
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 16,
        ),
      ),
    );
  }
}
