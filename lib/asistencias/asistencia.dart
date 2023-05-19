import 'package:dam_u4_proyecto2_19400586/firebase_services.dart';
import 'package:flutter/material.dart';

class Asistencia extends StatefulWidget {
  const Asistencia({Key? key}) : super(key: key);

  @override
  State<Asistencia> createState() => _AsistenciaState();
}

class _AsistenciaState extends State<Asistencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AGREGAR ASISTENCIA"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/');
          }, icon: Icon(Icons.arrow_back))
        ],),
      body:
      FutureBuilder(
          future: getAsistencia(),
          builder: ((context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){

                   return ListTile(
                        title: Text("Docente: " + snapshot.data?[index]['docente']),
                        subtitle: Text("Revisó: " + snapshot.data?[index]['revisor']),
                        trailing: Text("Fecha: \n" + snapshot.data?[index]['fecha']),


                      );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

          })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.pushNamed(context, '/addAsis');
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
