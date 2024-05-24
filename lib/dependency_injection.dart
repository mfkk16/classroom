import 'package:classroom/application/classrooms/classrooms_bloc.dart';
import 'package:classroom/application/student/student_bloc.dart';
import 'package:classroom/application/subject/subject_bloc.dart';
import 'package:classroom/domain/usecases/get_all_classroom_usecase.dart';
import 'package:classroom/domain/usecases/get_all_students_usecase.dart';
import 'package:classroom/domain/usecases/get_all_subjects_usecase.dart';
import 'package:classroom/infrastructure/network_repi_impli.dart';
import 'package:classroom/infrastructure/network_repo.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Network class
  sl.registerSingleton<NetworkRepo>(NetworkRepoImpli());

  // Usecases
  sl.registerSingleton<GetAllSubjectsUsecase>(GetAllSubjectsUsecase(sl()));
  sl.registerSingleton<GetAllStudentsUsecase>(GetAllStudentsUsecase(sl()));
  sl.registerSingleton<GetAllClassroomUsecase>(GetAllClassroomUsecase(sl()));

  // Bloc Classes
  sl.registerLazySingleton<SubjectBloc>(() => SubjectBloc(sl()));
  sl.registerLazySingleton<StudentBloc>(() => StudentBloc(sl()));
  sl.registerLazySingleton<ClassroomsBloc>(() => ClassroomsBloc(sl()));
}
