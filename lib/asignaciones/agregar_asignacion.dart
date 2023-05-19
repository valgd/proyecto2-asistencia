import 'package:dam_u4_proyecto2_19400586/firebase_services.dart';
import 'package:flutter/material.dart';

class AgregarAsignacion extends StatefulWidget {
  const AgregarAsignacion({Key? key}) : super(key: key);

  @override
  State<AgregarAsignacion> createState() => _AgregarAsignacionState();
}

class _AgregarAsignacionState extends State<AgregarAsignacion> {
  TextEditingController salonC = TextEditingController(text: "");
  TextEditingController edificioC = TextEditingController(text: "");
  TextEditingController horarioC = TextEditingController(text: "");
  TextEditingController docenteC = TextEditingController(text: "");
  TextEditingController materiaC = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("AÑADIR ASIGNACIÓN")),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Center(
                child: Text("INSERTA LOS DATOS CORRESPONDIENTES ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
              Center(
                child: Text("A LA ASIGNACIÓN A AGREGAR",
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
                  await insertarAsignacion(salonC.text, edificioC.text,
                      horarioC.text, docenteC.text,materiaC.text ).then((_){
                    Navigator.pop(context);
                  });

                }, child: Text("Guardar", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
              )

            ],
          ),
        )


    );
  }
}
