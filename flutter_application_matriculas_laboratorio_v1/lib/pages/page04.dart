import 'package:flutter/material.dart';
import 'package:flutter_application_matriculas_laboratorio_v1/models/models.dart';

class Page04 extends StatefulWidget {
  const Page04({super.key});

  @override
  State<Page04> createState() => _Page04State();
}

class _Page04State extends State<Page04> {
  Future<List<Curso>>? _listadoCursos;
  Estudiante estudiante = Estudiante(
    id: 1,
    nombre: "Alexander Dominic Chavez Salas",
    CUI: "20173381",
    correo: "achavezsa@unsa.edu.pe",
    contrasena: "12345678",
  );

  List<Matricula> matriculas = [];

  Future<List<Curso>> _getCursos() async {
    // Simulamos un retraso para cargar los cursos
    await Future.delayed(Duration(seconds: 2));

    // Lista de cursos simulados con vacantes y descripción
    List<Curso> cursos = [
      Curso(
        id: 1,
        codigo: "1233213",
        nombre: "Plataformas Emergentes",
        turno: Turno(
          docente: "Ing Calienes",
          horario: "Lun(8:50-10:40)_Mie(10:40-14:00)",
          letra: "A",
        ),
        descripcion: "Este curso abarca plataformas emergentes y cómo aplicarlas en el desarrollo de software.",
        vacantes: 5,
      ),
      Curso(
        id: 2,
        codigo: "9876543",
        nombre: "Desarrollo Web",
        turno: Turno(
          docente: "Ing Pérez",
          horario: "Mar(8:00-9:40)_Jue(10:00-12:00)",
          letra: "B",
        ),
        descripcion: "Aprende a desarrollar aplicaciones web desde cero utilizando las últimas tecnologías.",
        vacantes: 0,
      ),
      Curso(
        id: 3,
        codigo: "4567890",
        nombre: "Inteligencia Artificial",
        turno: Turno(
          docente: "Ing Quispe",
          horario: "Vie(8:00-10:00)",
          letra: "C",
        ),
        descripcion: "Este curso introduce los conceptos de la inteligencia artificial y el aprendizaje automático.",
        vacantes: 3,
      ),
    ];

    return cursos;
  }

  @override
  void initState() {
    super.initState();
    _listadoCursos = _getCursos();
  }

  bool _estaInscrito(int cursoId) {
    return matriculas.any((matricula) => matricula.cursoId == cursoId);
  }

  void _inscribirEstudiante(Curso curso) {
    setState(() {
      matriculas.add(Matricula(
        id: matriculas.length + 1,
        estudianteId: estudiante.id,
        CUIEstudiante: estudiante.CUI,
        cursoId: curso.id,
      ));
      curso.vacantes--; // Disminuir vacantes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INSCRIPCIÓN"),
      ),
      body: FutureBuilder<List<Curso>>(
        future: _listadoCursos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Curso curso = snapshot.data![index];
                bool inscrito = _estaInscrito(curso.id);

                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      "${curso.nombre} (Turno ${curso.turno.letra})",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Código: ${curso.codigo}\nDocente: ${curso.turno.docente}",
                    ),
                    trailing: ElevatedButton(
                      onPressed: (curso.vacantes > 0 && !inscrito)
                          ? () {
                              _mostrarModalInscripcion(context, curso);
                            }
                          : null, // Deshabilita el botón si las vacantes son 0 o ya está inscrito
                      child: Text(inscrito
                          ? "Inscrito"
                          : (curso.vacantes > 0 ? "Inscribirse" : "Sin Vacantes")),
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: Text("No hay cursos disponibles."));
        },
      ),
    );
  }

  void _mostrarModalInscripcion(BuildContext context, Curso curso) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Inscribirse en ${curso.nombre}",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Descripción:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                curso.descripcion,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Horario:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(curso.turno.horario.replaceAll("_", "\n")),
                    SizedBox(height: 10),
                    Text("Grupo: ${curso.turno.letra}"),
                    SizedBox(height: 10),
                    Text("Vacantes disponibles: ${curso.vacantes}"),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: curso.vacantes > 0
                  ? () {
                      _inscribirEstudiante(curso);
                      Navigator.of(context).pop();
                    }
                  : null, // Deshabilita si no hay vacantes
              child: Text(curso.vacantes > 0 ? "Confirmar Inscripción" : "Sin Vacantes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }
}