import 'package:dam_u4_proyecto2_19400586/firebase_services.dart';
import 'package:flutter/material.dart';

class ActualizarAsignacion extends StatefulWidget {
  const ActualizarAsignacion({Key? key}) : super(key: key);

  @override
  State<ActualizarAsignacion> createState() => _ActualizarAsignacionState();
}

class _ActualizarAsignacionState extends State<ActualizarAsignacion> {
  TextEditingController salonC = TextEditingController(text: "");
  TextEditingController edificioC = TextEditingController(text: "");
  TextEditingController horarioC = TextEditingController(text: "");
  TextEditingController docenteC = TextEditingController(text: "");
  TextEditingController materiaC = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    salonC.text = arguments["salon"];
    edificioC.text = arguments["edificio"];
    horarioC.text = arguments["horario"];
    docenteC.text = arguments["docente"];
    materiaC.text = arguments["materia"];

    return Scaffold(
        appBar: AppBar(title: Text("Actualizar Asignación")),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Center(
                child: Text("ACTUALIZA LA ASIGNACIÓN ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 25,),
              TextField(
                decoration: InputDecoration(labelText: "SALÓN: "),
                controller: salonC,
              ),
              SizedBox(height: 30,),

              TextField(
                decoration: InputDecoration(labelText: "EDIFICIO: "),
                controller: edificioC,
              ),
              SizedBox(height: 30,),

              TextField(
                decoration: InputDecoration(labelText: "HORARIO: "),
                controller: horarioC,
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(labelText: "DOCENTE: "),
                controller: docenteC,
              ),
              SizedBox(height: 30,),

              TextField(
                decoration: InputDecoration(labelText: "MATERIA: ")
                ,controller: materiaC,
              ),

              SizedBox(height: 30,),

              SizedBox(
                height: 60,width: 60,
                child:
                ElevatedButton(onPressed: () async{
                  await actualizarAsignacion(arguments["id"],
                      salonC.text,  edificioC.text,
                       horarioC.text, docenteC.text,
                      materiaC.text).then((_) {
                    Navigator.pop(context);
                  });

                }, child: Text("Actualizar", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
              )

            ],
          ),
        )


    );
  }
}
