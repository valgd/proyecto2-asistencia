import 'package:dam_u4_proyecto2_19400586/consultas/consultaCuatro.dart';
import 'package:flutter/material.dart';

import 'consultaUno.dart';

class Consultar extends StatefulWidget {
  const Consultar({Key? key}) : super(key: key);

  @override
  State<Consultar> createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("CONSULTAS"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/');
            }, icon: Icon(Icons.arrow_back))
          ],),
        body:
        ListView(
          padding: EdgeInsets.all(30),
          children: [

            SizedBox(height: 40,),
            Center(
              child: Text("CONSULTAR ASISTENCIA POR:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ),
            SizedBox(height: 40,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => ConsultaUno()));
              }, child: Text("DOCENTE", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

            SizedBox(height: 40,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                //Navigator.push(context, MaterialPageRoute(builder: (context)
                //=> ConsultaDos()));
              }, child: Text("FECHA", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

            SizedBox(height: 40,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){

              }, child: Text("EDIFICIO", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

            SizedBox(height: 40,),

            SizedBox(
              width: 50, height: 50,
              child:
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => ConsultaCuatro()));
              }, child: Text("REVISOR", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),

          ],
        )
    );
  }
}
