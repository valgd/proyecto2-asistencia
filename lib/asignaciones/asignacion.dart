import 'package:dam_u4_proyecto2_19400586/firebase_services.dart';
import 'package:flutter/material.dart';

class Asignacion extends StatefulWidget {
  const Asignacion({Key? key}) : super(key: key);

  @override
  State<Asignacion> createState() => _AsignacionState();
}

class _AsignacionState extends State<Asignacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AGREGAR ASIGNACIÓN"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/');
          }, icon: Icon(Icons.arrow_back))
        ],),
      body:
      FutureBuilder(
          future: getAsignacion(),
          builder: ((context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    return Dismissible(
                      onDismissed: (direction) async{
                        await eliminarAsignacion(snapshot.data?[index]["id"]);
                      },

                      confirmDismiss: (direction) async{
                        bool resultado = false;

                        resultado = await showDialog(context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("¿Desea eliminar la asignación del docente "
                                    "${snapshot.data?[index]["docente"]}?"),
                                actions: [
                                  TextButton(onPressed: (){
                                    return Navigator.pop(
                                      context,
                                      false,
                                    );
                                  }, child: Text("No")),
                                  TextButton(onPressed: (){
                                    return Navigator.pop(
                                      context,
                                      true,
                                    );
                                  }, child: Text("Sí"))
                                ],
                              );
                            });

                        return resultado;
                      },
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete),
                      ),
                      direction: DismissDirection.startToEnd,

                      key: UniqueKey(),
                      //key: Key(snapshot.data?[index]["id"]),

                      child: ListTile(
                        title: Text("Docente: " + snapshot.data?[index]['docente']),
                        subtitle: Text("Materia " + snapshot.data?[index]['materia']),
                        trailing: Text("Salón: \n" + snapshot.data?[index]['salon']),
                        leading: Text("Horario: \n" + snapshot.data?[index]['horario']),

                        onTap: () async{
                          await Navigator.pushNamed(context, "/actAsig",
                              arguments: {"salon": snapshot.data?[index]["salon"],
                                "edificio": snapshot.data?[index]["edificio"],
                                "horario": snapshot.data?[index]["horario"],
                                "docente": snapshot.data?[index]["docente"],
                                "materia": snapshot.data?[index]["materia"],
                                "id": snapshot.data?[index]["id"],
                              }
                          );
                          setState(() {

                          });
                        },

                      ),
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
          await Navigator.pushNamed(context, '/addAsig');
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
