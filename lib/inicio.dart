import 'package:flutter/material.dart';
import 'package:net_gpi_v1_0/review_list.dart';
import 'description_place.dart';
import 'header_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

String descricion =
    "La Panaderia Vicentino’s abrió sus puertas el 3 de Marzo del 2006 en un pequeño espacio en la 99 de la Broadway en Somerville. Como logo tiene la famosa torre de San Vicente y con un menú bastante extenso que incluye todo tipo de pan que se conoce en El Salvador. Entre esos están los salpores de arroz, alemanas, y tortas de yema, maríaluisa, budín, pasteles de piña y leche, viejitas y muchos más. Los clientes aprecian el sabor del pan y también el ambiente de la panadería. Una cliente frecuente confesó que “el pan de esta panadería es el más fresco y con mejor sabor, en los diez años de vivir aquí, un lugar como este nos hacía falta”. La música recuerda las fiestas anuales en el Parque de San Vicente, con las orquestas más conocidas del lugar, muchos se contagian con la nostalgia que guarda este pequeño rincón de El Salvador en Massachusetts.";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final User? usuario = FirebaseAuth.instance.currentUser;
    String? email = "";

    if (usuario != null) email = usuario.email;

    return Scaffold(
      appBar: AppBar(
        leading: new Container(),
        title: TextButton.icon(
          onPressed: () {
            _salir(context);
          },
          label: Text('Salir',
              style: TextStyle(fontSize: 25, color: Colors.white)),
          icon: Icon(
            Icons.logout,
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: Stack(
        children: <Widget>[
          ListView(children: <Widget>[
            DescriptionPlace("Pan Vicentino’s", 4, descricion),
            ReviewList()
          ]),
          HeaderAppbar()
        ],
      ),
    );
  }

  void _salir(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }
}
