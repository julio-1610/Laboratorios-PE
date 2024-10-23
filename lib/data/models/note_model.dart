class Note {
  int? id;
  String? title;
  String? content;

  Note({
    this.id,
    this.title,
    this.content,
  });

  // Convertir una nota dentro de un map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }

  //Obtener una nota dentro de un map

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int?,
      title: map['title'] as String?,
      content: map['content'] as String?,
    );
  }

}

