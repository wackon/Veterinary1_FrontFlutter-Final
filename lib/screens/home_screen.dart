// ignore_for_file: prefer_const_constructors, deprecated_member_use, library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:veterinary1/models/token.dart';
import 'package:veterinary1/screens/login_screen.dart';
import 'package:veterinary1/screens/procedimientos_screen.dart';
import 'package:veterinary1/screens/medicamentos_screen.dart';

import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'Mascotas_screen.dart';
import 'razas_screen.dart';

class HomeScreen extends StatefulWidget {
  final Token token;

  HomeScreen({required this.token});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Veterinary Clinic'),
        ),
        body: _getBody(),
        drawer: _getMenu());
  }

  Widget _getBody() {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            // ignore: sort_child_properties_last
            child: Image(
              image: AssetImage('images/home.png'),
              width: 300,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Bienvenid@ ${widget.token.user.userName}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Llamar a Veterinary'),
              SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 40,
                  width: 40,
                  color: Color.fromARGB(255, 93, 54, 138),
                  child: IconButton(
                    icon: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    onPressed: () => launch("tel://+573000000"),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Contactar!'),
              SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 40,
                  width: 40,
                  color: Colors.green,
                  child: IconButton(
                    icon: Icon(
                      Icons.insert_comment,
                      color: Colors.white,
                    ),
                    onPressed: () => _sendMessage(),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _getMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Image(
            image: AssetImage('images/logoIngreso.jpg'),
          )),
          ListTile(
            leading: Icon(Icons.pets),
            title: const Text('Mascota'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MascotasScreen(
                            token: widget.token,
                          )));
            },
          ),
          ListTile(
            leading: Icon(Icons.playlist_add_check_circle_outlined),
            title: const Text('Medicamentos'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MedicamentosScreen(
                            token: widget.token,
                          )));
            },
          ),
          ListTile(
            leading: Icon(Icons.type_specimen),
            title: const Text('Razas'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RazasScreen(
                            token: widget.token,
                          )));
            },
          ),
          ListTile(
            leading: Icon(Icons.precision_manufacturing),
            title: const Text('Procedimientos'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProcedimientosScreen(
                            token: widget.token,
                          )));
            },
          ),
          /*   ListTile(
            leading: Icon(Icons.precision_manufacturing),
            title: const Text('Procedimientos'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProcedimientosScreen(
                            token: widget.token,
                          )));
            },
          ),
          ListTile(
            leading: Icon(Icons.badge),
            title: const Text('Tipo documento'),
            onTap: () {},
          ), */
          ListTile(
            leading: Icon(Icons.pets),
            title: const Text('Tipo Mascota'),
            onTap: () {},
          ),
          Divider(
            color: Colors.black,
            height: 2,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Cerrar Sesión'),
            onTap: () => _logOut(),
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+573000000000',
      text: 'Hola soy ${widget.token.user.fullName} cliente de la Clínica',
    );
    await launch('$link');
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRemembered', false);
    await prefs.setString('userBody', '');

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
