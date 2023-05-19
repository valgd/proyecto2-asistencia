import 'package:dam_u4_proyecto2_19400586/firebase_services.dart';
import 'package:flutter/material.dart';

class ConsultaCuatro extends StatefulWidget {
  const ConsultaCuatro({Key? key}) : super(key: key);

  @override
  State<ConsultaCuatro> createState() => _ConsultaCuatroState();
}

final revisorCon = TextEditingController();

class _ConsultaCuatroState extends State<ConsultaCuatro> {
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
          Text("Consulte los revisores actuales", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          SizedBox(
            height: 50,
            width: 50,
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/asistencia');
            }, child: Text("Ver todos los revisores que han registrado asistencia")),

          ),
          SizedBox(height: 20,),

          Text("Inserte el nombre del revisor de la asistencia que desea consultar:", style: TextStyle(fontSize: 15)),

          TextField(decoration: InputDecoration(labelText: "Revisor:",),
            controller: revisorCon,),

          SizedBox(height: 30,),

          SizedBox(
            height: 50, width: 50,
            child: ElevatedButton(onPressed: () async {
              setState(() {
                revisorCon.text;
              });
            }, child: Text("Consultar",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            ),
          ),

          SizedBox(height: 30,),

          Text("Asistencia obtenida: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),


          FutureBuilder<List<Map<String, dynamic>>>(
            future: consultaCuatro(revisorCon.text),
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
