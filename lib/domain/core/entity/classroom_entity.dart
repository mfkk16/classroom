class ClassroomEntity {
  final int? id;
  final String? layout;
  final String? name;
  final int? size;
  final dynamic subject;

  ClassroomEntity(
      {required this.id,
      required this.layout,
      required this.name,
      required this.size,
      this.subject});
}
