// Clase que representa la estructura del turno
class Turno {
  final String docente;
  final String horario;
  final String letra;

  Turno({
    required this.docente,
    required this.horario,
    required this.letra,
  });
}

// Clase que representa la estructura del curso
class Curso {
  final int id;
  final String codigo;
  final String nombre;
  final Turno turno;
  final String descripcion;
  int vacantes;

  Curso({
    required this.id,
    required this.codigo,
    required this.nombre,
    required this.turno,
    required this.descripcion,
    required this.vacantes,
  });
}

// Clase que representa la estructura del estudiante
class Estudiante {
  final int id;
  final String nombre;
  final String CUI;
  final String correo;
  final String contrasena;

  Estudiante({
    required this.id,
    required this.nombre,
    required this.CUI,
    required this.correo,
    required this.contrasena,
  });
}

// Clase que representa la estructura de una matrícula
class Matricula {
  final int id;
  final int estudianteId;
  final String CUIEstudiante;
  final int cursoId;

  Matricula({
    required this.id,
    required this.estudianteId,
    required this.CUIEstudiante,
    required this.cursoId,
  });
}