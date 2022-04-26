import 'package:flutter/material.dart';
import 'package:lab13/pages/page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Estudiante> _estudiantes = [
    Estudiante(
        " 18760461 ",
        "Andrea Denisse Ramírez Aguilar  ",
        " ing. sistemas computaciónales  ",
        " 8vo  ",
        " 646-123-45-67  ",
        " al18760461@ite.edu.mx  "),
    Estudiante(
        " 12456789  ",
        "Denisse Andrea Aguilar Ramírez  ",
        " ing. sistemas computaciónales  ",
        " 1ro  ",
        " 686-198-63-21  ",
        " al12456789@ite.edu.mx  "),
    Estudiante(
        " 18765421  ",
        "Kaelyn Dana Acosta Ramos  ",
        " ing. Mecatronica  ",
        " 5to  ",
        " 646-698-78-15  ",
        " al18765421@ite.edu.mx  "),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 243, 163, 255),
            centerTitle: true,
            title: const Text('Estudiantes',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 29, 13, 175))),
          ),
          body: Container(
              color: const Color.fromARGB(204, 255, 255, 255),
              child: ListView.builder(
                  itemCount: _estudiantes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onLongPress: () {
                        _eliminar(context, _estudiantes[index]);
                      },
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Page1(
                                      matricula: _estudiantes[index].matricula,
                                      nombrecompleto:
                                          _estudiantes[index].nombrecompleto,
                                      carrera: _estudiantes[index].carrera,
                                      semestre: _estudiantes[index].semestre,
                                      telefono: _estudiantes[index].telefono,
                                      correo: _estudiantes[index].correo,
                                    ))));
                      },
                      title: Text(
                        _estudiantes[index].nombrecompleto,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 29, 13, 175)),
                      ),
                      subtitle: Text(
                        _estudiantes[index].correo,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 221, 9, 147)),
                      ),
                      leading: CircleAvatar(
                        child: Text(
                            _estudiantes[index].nombrecompleto.substring(0, 1)),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  }))),
    );
  }

  _eliminar(context, Estudiante estudiante) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Eliminar estudiante"),
              content: Text("¿Está seguro de eliminar a " +
                  estudiante.nombrecompleto +
                  '?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar")),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _estudiantes.remove(estudiante);
                      });
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Borrar",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ));
  }
}

class Estudiante {
  String matricula;
  String nombrecompleto;
  String carrera;
  String semestre;
  String telefono;
  String correo;

  Estudiante(this.matricula, this.nombrecompleto, this.carrera, this.semestre,
      this.telefono, this.correo);
}
