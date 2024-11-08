// Class representing the structure of a shift
class Shift {
  final String teacher;
  final String schedule;
  final String letter;

  Shift({
    required this.teacher,
    required this.schedule,
    required this.letter,
  });
}

// Class representing the structure of a course
class Course {
  final int id;
  final String code;
  final String name;
  final Shift shift;
  final String description;
  int vacancies;

  Course({
    required this.id,
    required this.code,
    required this.name,
    required this.shift,
    required this.description,
    required this.vacancies,
  });
}

// Class representing the structure of a student
class Student {
  final int id;
  final String name;
  final String cui;
  final String email;
  final String password;

  Student({
    required this.id,
    required this.name,
    required this.cui,
    required this.email,
    required this.password,
  });
}

// Class representing the structure of an enrollment
class Enrollment {
  final int id;
  final int studentId;
  final String studentCUI;
  final int courseId;

  Enrollment({
    required this.id,
    required this.studentId,
    required this.studentCUI,
    required this.courseId,
  });
}