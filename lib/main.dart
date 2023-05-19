import 'package:dam_u4_proyecto2_19400586/asignaciones/actualizar_asignacion.dart';
import 'package:dam_u4_proyecto2_19400586/asignaciones/agregar_asignacion.dart';
import 'package:dam_u4_proyecto2_19400586/asignaciones/asignacion.dart';
import 'package:dam_u4_proyecto2_19400586/asistencias/agregar_asistencia.dart';
import 'package:dam_u4_proyecto2_19400586/asistencias/asistencia.dart';
import 'package:dam_u4_proyecto2_19400586/consultas/consultar.dart';
import 'package:flutter/material.dart';

import 'inicio.dart';

//importaciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
    initialRoute: '/',
    //SISTEMA DE RUTAS
    routes: {
      '/': (context) => const Inicio(),
      '/asignacion': (context) => const Asignacion(),
      '/addAsig': (context) => const AgregarAsignacion(),
      '/addAsis': (context) => const AgregarAsistencia(),
      '/actAsig': (context) => const ActualizarAsignacion(),
      '/asistencia': (context) => const Asistencia(),
      '/cons': (context) => const Consultar(),
    }
    );
  }
}


