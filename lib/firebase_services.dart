import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore bd = FirebaseFirestore.instance;

// LEER DATOS
//FUNCIÓN QUE REGRESA LA INFORMACIÓN DESDE FIREBASE
Future <List> getAsignacion() async{
  List asignacion = [];

  //CREAR REFERENCIA A LA COLECCIÓN
  CollectionReference collectionReferenceAsignacion = bd.collection('asignacion');

  //TRAER LOS DOCUMENTOS QUE TIENE LA COLECCIÓN
  // EL ARCHIVO QUERYVEHICULOS CONTIENE Y VA A TRAER TODOS LOS REGISTROS
  QuerySnapshot queryAsignacion = await collectionReferenceAsignacion.get();

  //RECORRER LA LISTA DE DOCUMENTOS
  queryAsignacion.docs.forEach((documento) {

    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final asi = {
      "salon": data["salon"],
      "edificio": data["edificio"],
      "horario" : data["horario"],
      "docente": data["docente"],
      "materia": data["materia"],

      "id": documento.id,
    };

    //  agregar los datos del documento a la lista 1 por 1
    asignacion.add(asi);
  });

  return asignacion;
}


Future <List> getAsistencia() async{
  List asistencia = [];

  //CREAR REFERENCIA A LA COLECCIÓN
  CollectionReference collectionReferenceAsistencia = bd.collection('asistencia');

  //TRAER LOS DOCUMENTOS QUE TIENE LA COLECCIÓN
  // EL ARCHIVO QUERYVEHICULOS CONTIENE Y VA A TRAER TODOS LOS REGISTROS
  QuerySnapshot queryAsistencia = await collectionReferenceAsistencia.get();

  //RECORRER LA LISTA DE DOCUMENTOS
  queryAsistencia.docs.forEach((documento) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final bit = {
      "fecha": data["fecha"],
      "revisor": data["revisor"],
      "docente": data["docente"],
      "id": documento.id,
    };

    //  agregar los datos del documento a la lista 1 por 1
    asistencia.add(bit);
  });

  return asistencia;
}

//GUARDAR EN LA BD
Future<void> insertarAsignacion (String salon, String edificio,
    String horario, String docente, String materia,) async{
  await bd.collection("asignacion").add({"salon": salon, "edificio":edificio,
    "horario":horario, "docente":docente, "materia":materia,});
}

Future<void> insertarAsistencia(String fecha, String revisor, String docente) async{
  await bd.collection("asistencia").add({"fecha":fecha, "revisor":revisor, "docente":docente});
}

//ACTUALIZAR EN LA BD
Future<void> actualizarAsignacion(String id, String salonAct, String edificioAct,
    String horarioAct, String docenteAct, String materiaAct) async{
  await bd.collection("asignacion").doc(id).set({"salon": salonAct,
    "edificio": edificioAct, "horario":horarioAct, "docente": docenteAct,
    "materia": materiaAct,});
}


//ELIMINAR EN LA BD
Future <void> eliminarAsignacion(String id) async{
  await bd.collection("asignacion").doc(id).delete();
}

// CONSULTAS
// consultar asistencia de un docente determinado
Future<List<Map<String,dynamic>>> consultaUno(String docente) async{
  List<Map<String, dynamic>> consulta = [];
  QuerySnapshot querySnapshot = await bd.collection("asistencia").where("docente", isEqualTo: docente).get();
  for(var docSnapshot in querySnapshot.docs){
    final Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
    consulta.add({"docente": data["docente"], "fecha": data["fecha"],
      "revisor": data["revisor"]
    });
  }
  return consulta;
}

Future<List<Map<String,dynamic>>> consultaCuatro(String revisor) async{
  List<Map<String, dynamic>> consulta = [];
  QuerySnapshot querySnapshot = await bd.collection("asistencia").where("revisor", isEqualTo: revisor).get();
  for(var docSnapshot in querySnapshot.docs){
    final Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
    consulta.add({"docente": data["docente"], "fecha": data["fecha"],
      "revisor": data["revisor"]
    });
  }
  return consulta;
}
