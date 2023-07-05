import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sample_app/pages/searching.dart';

class MapTesting extends StatefulWidget {
  const MapTesting({super.key});

  @override
  State<MapTesting> createState() => _MapTestingState();
}

class AppConstants {
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoiaGFyc2h1MDcxMSIsImEiOiJjbGppZHpsbXYwbWFtM3BvNWd1eDZ3a210In0.zj_4e5MiDhPqzk1bALR4zA';

  static const String mapBoxStyleId = 'cljieeo5b002d01o40q7fdqs1';

  static final myLocation = LatLng(21.250000, 81.629997);
}

class MapMarker {
  final LatLng? location;

  MapMarker({
    required this.location,
  });
}

final mapMarkers = [
  MapMarker(
    location: LatLng(21.2441408, 81.6319132),
  ),
  MapMarker(
    location: LatLng(21.2441417, 81.6290905),
  ),
  MapMarker(
    location: LatLng(21.2448292, 81.6403591),
  ),
];

class _MapTestingState extends State<MapTesting> {
  bool wheelChairSelected = false;
  bool onboardingSelected = false;
  bool signSelected = false;
  String wheelchair = 'Wheelchair';
  String assistance = 'Onboard Assistance';
  String sign = 'Sign language';
  String pickUp = '';
  String destination = '';

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_picture.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'My Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.electric_scooter),
              title: Text('Electric'),
              onTap: () {
                // Handle Electric press
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Your Rides'),
              onTap: () {
                // Handle Your Rides press
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Ola Money'),
              onTap: () {
                // Handle Ola Money press
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payments'),
              onTap: () {
                // Handle Payments press
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Insurance'),
              onTap: () {
                // Handle Insurance press
              },
            ),
            ListTile(
              leading: Icon(Icons.headset_mic),
              title: Text('Support'),
              onTap: () {
                // Handle Support press
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Handle About press
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                _globalKey.currentState?.openDrawer();
              }),
          Stack(
            children: [
              IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.black,
                  onPressed: () {
                    _globalKey.currentState?.openDrawer();
                  }),
              FlutterMap(
                options: MapOptions(
                    minZoom: 5,
                    maxZoom: 18,
                    zoom: 13,
                    center: AppConstants.myLocation),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/harshu0711/cljieeo5b002d01o40q7fdqs1/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGFyc2h1MDcxMSIsImEiOiJjbGppZHpsbXYwbWFtM3BvNWd1eDZ3a210In0.zj_4e5MiDhPqzk1bALR4zA",
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                          point: LatLng(21.2441408, 81.6319132),
                          builder: (_) {
                            return GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/location.png',
                                ));
                          }),
                      (wheelChairSelected
                          ? Marker(
                              point: LatLng(21.2441417, 81.6290905),
                              builder: (_) {
                                return GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/cabIcon.png',
                                    ));
                              })
                          : Marker(
                              point: LatLng(21.2448292, 81.6403591),
                              builder: (_) {
                                return GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/cabIcon.png',
                                    ));
                              }))
                    ],
                  )
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              height: 300,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.white)),
                          onPressed: () {
                            setState(() {
                              wheelChairSelected = !wheelChairSelected;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: (wheelChairSelected
                                            ? Colors.black
                                            : Colors.white),
                                        width: 2.0,
                                        style: BorderStyle.solid))),
                            child: Column(
                              children: [
                                Image.asset('assets/images/wheelchairCab.png',
                                    height: 60, width: 60),
                                Text(
                                  'Wheelchair',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                )
                              ],
                            ),
                          )),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.white)),
                        onPressed: () {
                          setState(() {
                            onboardingSelected = !onboardingSelected;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: (onboardingSelected
                                          ? Colors.black
                                          : Colors.white),
                                      width: 2.0,
                                      style: BorderStyle.solid))),
                          child: Column(
                            children: [
                              Image.asset('assets/images/onboarding.png',
                                  height: 60, width: 60),
                              Text(
                                'On/off Boarding',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.white)),
                          onPressed: () {
                            setState(() {
                              signSelected = !signSelected;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: (signSelected
                                            ? Colors.black
                                            : Colors.white),
                                        width: 2.0,
                                        style: BorderStyle.solid))),
                            child: Column(
                              children: [
                                Image.asset('assets/images/signLanguage.png',
                                    height: 60, width: 60),
                                Text(
                                  'Sign Language',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 5, 8, 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 1,
                              blurRadius: 5)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search Destination',
                                suffixIcon: Icon(Icons.search),
                                fillColor: Colors.black),
                            onChanged: (value) {
                              // Handle search input
                              setState(() {
                                destination = value;
                              });
                            },
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchingCab(
                                          wheelChairSelected:
                                              wheelChairSelected,
                                          onboardingSelected:
                                              onboardingSelected,
                                          signSelected: signSelected,
                                          pickUp: pickUp,
                                          destination: destination)));
                            },
                            child: Text('Search Ride')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: EdgeInsets.fromLTRB(15, 30, 15, 0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.black,
                          onPressed: () {
                            _globalKey.currentState?.openDrawer();
                          }),
                      Container(
                        height: 25,
                        width: 280,
                        margin: EdgeInsets.all(10),
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Pick Up Location',
                            suffixIcon: Icon(Icons.search),
                          ),
                          onChanged: (value) {
                            // Handle search input
                            pickUp = value;
                          },
                        ),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}