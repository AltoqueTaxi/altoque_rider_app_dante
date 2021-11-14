import 'package:driver_app/pages/widgets/button_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:driver_app/providers/driver_map_controller.dart';
import 'package:driver_app/providers/application_provider.dart';
import 'package:driver_app/pages/utils/style.dart';
import 'package:driver_app/pages/widgets/custom_text.dart';
import 'package:driver_app/pages/widgets/rider_draggable.dart';
import 'package:driver_app/pages/widgets/stars.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DriverMapController _con =
      DriverMapController(); // No es parte del provider

  @override
  void initState() {
    super.initState();
    //_deviceToken();
    //_updatePosition();    // Actualiar la posicion del conductor en DB cuando incia la aplicacion
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      // una vez que un widget haya terminado de compilarse
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool connected = true;
    final applicatiionProvider = Provider.of<ApplicatiionProvider>(context);
    return Scaffold(
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
              ),
              accountEmail: Text('arpanet80@gmail.com'),
              accountName: Text(
                'Franklin Elias',
                style: TextStyle(fontSize: 24.0),
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.house),
              title: const Text(
                'Houses',
                style: TextStyle(fontSize: 24.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.apartment),
              title: const Text(
                'Apartments',
                style: TextStyle(fontSize: 24.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const CustomText(
                text: "Log out",
                color: StyleApp.white,
              ),
              onTap: () {},
            )
          ],
        )),
        body: (applicatiionProvider.currentLocation == null)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                //body: Stack(
                children: [
                  //_googleMapsWidget(),
                  GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                              applicatiionProvider.currentLocation!.latitude,
                              applicatiionProvider.currentLocation!.longitude),
                          zoom: 14),
                      onMapCreated: _con.onMapCreated,
                      myLocationEnabled: false,
                      myLocationButtonEnabled: false,
                      markers: Set<Marker>.of(_con.markers.values)),

                  Positioned(
                      top: 60,
                      left: MediaQuery.of(context).size.width / 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: StyleApp.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(color: StyleApp.grey, blurRadius: 17)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white30,
                                  child: ClipRRect(
                                    child: Image.asset('assets/img/bill.png'),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),

                                  //child: Icon(Icons.person_outline,size: 25,),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  height: 60,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        text: "Franklin Elias G.",
                                        size: 18,
                                        weight: FontWeight.bold,
                                      ),
                                      stars(rating: 4, votes: 500)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  (connected == false)
                      ? Expanded(
                          child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment.bottomCenter,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 60, vertical: 30),
                                    child: const ButtonApp(
                                      text: 'CONECTAR A LA APP',
                                      color: Colors.green,
                                      textColor: Colors.white,
                                    ),
                                  ))),
                        )
                      /*: Expanded(
                          child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment.bottomCenter,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 60, vertical: 30),
                                    child: const ButtonApp(
                                      text: 'DESCONECTAR DE LA APP',
                                      color: Colors.red,
                                      textColor: Colors.white,
                                    ),
                                  ))),
                        )*/

                      /*: Positioned(
                          top: MediaQuery.of(context).size.height - 120,
                          left: MediaQuery.of(context).size.width / 6,
                          child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Container(
                                height: 50,
                                alignment: Alignment.bottomCenter,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 30),
                                child: const ButtonApp(
                                  text: 'CCONECTAR A LA APP',
                                  color: Colors.red,
                                  textColor: Colors.white,
                                ),
                              ))),
*/
                      : const SafeArea(
                          child: Visibility(
                              visible: true, //appState.show == Show.RIDER,
                              child: RiderDraggableWidget()),
                        ),
                ],
              ));
  }

  /*Widget _googleMapsWidget() {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _con.initialPosition,
        onMapCreated: _con.onMapCreated,
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        markers: Set<Marker>.of(_con.markers.values));
  }*/

  void refresh() {
    setState(() {});
  }

  cambiaEstadoBoton(bool connected) {
    connected = true;
  }
}
