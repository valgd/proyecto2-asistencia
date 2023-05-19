import 'package:dam_u4_proyecto2_19400586/firebase_services.dart';
import 'package:flutter/material.dart';

class AgregarAsistencia extends StatefulWidget {
  const AgregarAsistencia({Key? key}) : super(key: key);

  @override
  State<AgregarAsistencia> createState() => _AgregarAsistenciaState();
}


class _AgregarAsistenciaState extends State<AgregarAsistencia> {

  String currentDateTime = '';

  @override
  void initState() {
    super.initState();
    getCurrentDateTime();
  }

  void getCurrentDateTime() {
    final now = DateTime.now();
    setState(() {
      currentDateTime = now.toString();
    });
  }

  TextEditingController revisorC = TextEditingController(text: "");
  TextEditingController docenteC = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("AÑADIR ASISTENCIA")),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Center(
                child: Text("INSERTA LOS DATOS CORRESPONDIENTES ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
              Center(
                child: Text("A LA ASISTENCIA A AGREGAR",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 25,),

              TextField(
                  readOnly: true,
                  controller: TextEditingController(text: currentDateTime),
                  decoration: InputDecoration(
                    labelText: 'FECHA Y HORA:',
                  )),

              SizedBox(height: 30,),

              TextField(
                decoration: InputDecoration(labelText: "REVISOR: "),
                controller: revisorC,
              ),
              SizedBox(height: 30,),

              TextField(
                decoration: InputDecoration(labelText: "DOCENTE: "),
                controller: docenteC,
              ),
              SizedBox(height: 30,),

              SizedBox(
                height: 60,width: 60,
                child:
                ElevatedButton(onPressed: () async{
                  await insertarAsistencia(currentDateTime.toString(), revisorC.text,
                      docenteC.text).then((_){
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
