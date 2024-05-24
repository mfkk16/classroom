part of 'student_bloc.dart';

@immutable
sealed class StudentEvent {}

class FetchAllStudents extends StudentEvent {}
