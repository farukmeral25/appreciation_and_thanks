class RelatedPersonDto {
  final String id;
  final String title;

  RelatedPersonDto({required this.id, required this.title});

  factory RelatedPersonDto.fromMap(Map<String, dynamic> map) {
    return RelatedPersonDto(
      id: map['id'],
      title: map['title'],
    );
  }
}
