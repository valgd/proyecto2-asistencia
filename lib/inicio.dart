import 'package:dam_u4_proyecto2_19400586/asistencias/asistencia.dart';
import 'package:flutter/material.dart';

import 'asignaciones/asignacion.dart';
import 'consultas/consultar.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("REGISTRO DE ASISTENCIA"),
          centerTitle: true,),
        body:
        ListView(
          padding: EdgeInsets.all(30),
          children: [
            Row(
              children: [
                SizedBox(
                  height: 120, width: 120, child: Image(image: AssetImage('/itt.png'),),
                ),
                SizedBox(width: 530,),
                Column(
                  children: [
                    Text("INSTITUTO TECNOLÓGICO", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("DE TEPIC",  style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),

                SizedBox(width: 530,),

                SizedBox(
                  height: 120, width: 100, child: Image(image: AssetImage('/tecnm.png'),),
                ),
              ],
            ),

            SizedBox(height: 50,),
            Center(
              child:  Text("BIENVENIDO",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),) ,
            ),
            SizedBox(height: 15,),
            Center(
              child:
              Text("REGISTRO DE ASISTENCIA", style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,)),
            ),

            SizedBox(height: 40,),
            Center(
              child: Text("¿QUÉ DESEA REGISTRAR HOY?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ),
            SizedBox(height: 35,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => Asignacion()));
              }, child: Text("ASIGNACIÓN", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

            SizedBox(height: 35,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => Asistencia()));
              }, child: Text("ASISTENCIA", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

            SizedBox(height: 35,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => Consultar()));
              }, child: Text("CONSULTAR INFORMACIÓN ESPECÍFICA", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

          ],
        )
    );
  }
}
