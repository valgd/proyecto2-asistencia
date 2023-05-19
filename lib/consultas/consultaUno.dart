import 'package:flutter/material.dart';

import '../firebase_services.dart';

class ConsultaUno extends StatefulWidget {
  const ConsultaUno({Key? key}) : super(key: key);

  @override
  State<ConsultaUno> createState() => _ConsultaUnoState();
}

final docenteCon = TextEditingController();

class _ConsultaUnoState extends State<ConsultaUno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DOCENTES",),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cons');
          }, icon: Icon(Icons.arrow_back))
        ],),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Text("Consulte los docentes actuales", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          SizedBox(
            height: 50,
            width: 50,
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/asistencia');
            }, child: Text("Ver todos los docentes con asistencia")),

          ),
          SizedBox(height: 20,),

          Text("Inserte el nombre del docente de la asistencia que desea consultar:", style: TextStyle(fontSize: 15)),

          TextField(decoration: InputDecoration(labelText: "Docente:",),
            controller: docenteCon,),

          SizedBox(height: 30,),

          SizedBox(
            height: 50, width: 50,
            child: ElevatedButton(onPressed: () async {
              setState(() {
                docenteCon.text;
              });
            }, child: Text("Consultar",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            ),
          ),

          SizedBox(height: 30,),

          Text("Asistencia obtenida: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),


          FutureBuilder<List<Map<String, dynamic>>>(
            future: consultaUno(docenteCon.text),
            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot){
              if(snapshot.hasData){
                return
                  Container(
                    height: 200,
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index){
                          return
                            Text("Fecha: ${snapshot.data![index]["fecha"]}\n"
                                "\n Docente:  ${snapshot.data![index]["docente"]}\n"
                                "\n Revisó: ${snapshot.data![index]["revisor"]}\n",
                              style: TextStyle(fontSize: 15,),
                            );

                        }

                    ),
                  );
              } else{
                return Text("");
              }
            } ,

          ),
        ],
      ),
    );
  }
}
